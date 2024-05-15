provider "aws" {
  region = var.region # Default region for most resources
}

provider "aws" {
  alias  = "global"
  region = "us-east-1" # CloudFront specific provider
}

module "vpc" {
  source       = "../modules/vpc"
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  subnets      = var.subnets
}

module "security_groups" {
  source       = "../modules/security_groups"
  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
  office_ip    = var.office_ip
}

module "frontend_s3_bucket" {
  source       = "../modules/s3_buckets"
  project_name = var.project_name
}

module "acm" {
  source          = "../modules/acm"
  domain_name     = var.domain_name
  route53_zone_id = var.route53_zone_id
}

module "cloudfront" {
  source              = "../modules/cloudfront"
  bucket_name         = module.frontend_s3_bucket.bucket_name
  domain_names        = var.cloudfront_domain_names
  acm_certificate_arn = module.acm.cloudfront_certificate_arn
  route53_zone_id     = var.route53_zone_id
  oai_comment         = "Origin Access Identity for ${var.project_name}"
}


resource "aws_route53_record" "cf_aliases" {
  provider = aws.global
  for_each = toset(var.cloudfront_domain_names)

  zone_id = var.route53_zone_id
  name    = each.value
  type    = "A"

  alias {
    name                   = module.cloudfront.cloudfront_distribution_domain
    zone_id                = module.cloudfront.cloudfront_distribution_hosted_zone_id
    evaluate_target_health = true
  }
}

module "iam_role_ec2_ssm" {
  source = "../modules/iam"
}

module "ec2_instance" {
  source                    = "../modules/ec2"
  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  key_name                  = var.key_name
  instance_subnet           = var.instance_subnet
  subnet_id                 = module.vpc.subnet_ids[var.instance_subnet]
  security_group_id         = module.security_groups.ec2_security_group_id
  iam_instance_profile_name = module.iam_role_ec2_ssm.iam_instance_profile_name
  project_name              = var.project_name
}

module "rds_subnet_group" {
  source           = "../modules/rds-subnet-group"
  project_name     = var.project_name
  subnet_ids       = [for key, val in module.vpc.rds_subnet_ids : val]
  environment_name = var.environment_name
}
