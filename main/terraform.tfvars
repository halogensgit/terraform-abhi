project_name = "vsws-prod"
region       = "ap-northeast-2"
vpc_cidr     = "10.0.0.0/16"
environment_name    = "production"
subnets = {
  "public-subnet1"  = { cidr: "10.0.1.0/24", az: "ap-northeast-2a", route_table: "public" },
  "private-subnet1" = { cidr: "10.0.2.0/24", az: "ap-northeast-2a", route_table: "private" },
  "alb-subnet1"     = { cidr: "10.0.3.0/24", az: "ap-northeast-2a", route_table: "public" },
  "alb-subnet2"     = { cidr: "10.0.4.0/24", az: "ap-northeast-2c", route_table: "public" },
  "rds-subnet1"     = { cidr: "10.0.5.0/24", az: "ap-northeast-2a", route_table: "private" },
  "rds-subnet2"     = { cidr: "10.0.6.0/24", az: "ap-northeast-2c", route_table: "private" }
}

// For AWS Certificate Manager (For ALB)
// CloudFront region is defined in acm module main.tf file
domain_name   = "halogenslearning.com"
route53_zone_id = "Z013519714YHQC8RITFT3"  // Your actual Route 53 hosted zone ID (For Everything related to R53)
aws_region    = "ap-northeast-2"    

// For CloudFront
bucket_name = "vsws-prod-frontend-s3"
cloudfront_domain_names  = [ "dev.halogenslearning.com" ]




