project_name     = "vsws-prod"
region           = "ap-northeast-2"
vpc_cidr         = "10.0.0.0/16"
environment_name = "production"
subnets = {
  "public-subnet-2a"  = { cidr : "10.0.1.0/24", az : "ap-northeast-2a", route_table : "public" },
  "private-subnet-2a" = { cidr : "10.0.2.0/24", az : "ap-northeast-2a", route_table : "private" },
  "alb-subnet-2a"     = { cidr : "10.0.3.0/24", az : "ap-northeast-2a", route_table : "public" },
  "alb-subnet-2b"     = { cidr : "10.0.4.0/24", az : "ap-northeast-2b", route_table : "public" },
  "alb-subnet-2c"     = { cidr : "10.0.5.0/24", az : "ap-northeast-2c", route_table : "public" },
  "rds-subnet-2a"     = { cidr : "10.0.6.0/24", az : "ap-northeast-2a", route_table : "private" },
  "rds-subnet-2b"     = { cidr : "10.0.7.0/24", az : "ap-northeast-2b", route_table : "private" },
  "rds-subnet-2c"     = { cidr : "10.0.8.0/24", az : "ap-northeast-2c", route_table : "private" },
  "ecs-subnet-2a"     = { cidr : "10.0.9.0/24", az : "ap-northeast-2a", route_table : "private" },
  "ecs-subnet-2b"     = { cidr : "10.0.10.0/24", az : "ap-northeast-2b", route_table : "private" },
  "ecs-subnet-2c"     = { cidr : "10.0.11.0/24", az : "ap-northeast-2c", route_table : "private" }

}

// For AWS Certificate Manager (For ALB)
// CloudFront region is defined in acm module main.tf file
domain_name     = "halogenslearning.com"
route53_zone_id = "Z013519714YHQC8RITFT3" // Your actual Route 53 hosted zone ID (For Everything related to R53)
aws_region      = "ap-northeast-2"

// For CloudFront
bucket_name             = "vsws-prod-frontend-s3"
cloudfront_domain_names = ["dev.halogenslearning.com"]

// For EC2 Security Group

office_ip = "183.82.107.253/32" // Replace "your_office_ip_here/32" with the actual CIDR notation of your office IP


// For EC2

ami_id          = "ami-01b15011585ebc739"
instance_type   = "t2.micro"
key_name        = "vsws-prod"
instance_subnet = "vsws-prod-public-subnet-2a" # You can change this as needed for different deployments
