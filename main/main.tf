provider "aws" {
  region = var.region  # Default region for most resources
}

provider "aws" {
  alias  = "global"
  region = "us-east-1"  # CloudFront specsific provider
}

module "vpc" {
  source       = "../modules/vpc"
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  subnets      = var.subnets
}

module "ec2_security_group" {
  source       = "../modules/security_groups"
  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "frontend_s3_bucket" {
  source       = "../modules/s3_buckets"
  project_name = var.project_name
}

module "acm" {
  source         = "../modules/acm"
  domain_name    = var.domain_name
  route53_zone_id = var.route53_zone_id
}

module "cloudfront" {
  source                 = "../modules/cloudfront"
  bucket_name            = module.frontend_s3_bucket.bucket_name
  domain_names           = var.cloudfront_domain_names
  acm_certificate_arn    = module.acm.cloudfront_certificate_arn 
  route53_zone_id        = var.route53_zone_id
  oai_comment            = "Origin Access Identity for ${var.project_name}"
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

output "ec2_ssm_role_arn" {
  value = module.iam_role_ec2_ssm.iam_role_arn
}
