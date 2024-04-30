provider "aws" {
  region = var.region  # Default region for most resources
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
  source        = "../modules/acm"
  domain_name   = var.domain_name
  route53_zone_id = var.route53_zone_id
  aws_region    = var.aws_region
}

