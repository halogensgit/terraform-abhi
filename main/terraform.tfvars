project_name     = "curengo-prod"
region           = "ap-northeast-2"
vpc_cidr         = "10.0.0.0/16"
environment_name = "Production"
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
domain_name     = "abhinaydurishetty.in"
route53_zone_id = "Z0836783N8WCTNP7MVLQ" // Your actual Route 53 hosted zone ID (For Everything related to R53)
aws_region      = "ap-northeast-2"

// For CloudFront
bucket_name             = "curengo-prod-frontend-s3"
cloudfront_domain_names = ["www.abhinaydurishetty.in", "abhinaydurishetty.in"]

// For EC2 Security Group

office_ip = "183.82.107.253/32" // Replace "your_office_ip_here/32" with the actual CIDR notation of your office IP


// For EC2

ami_id          = "ami-0dfabddd52dec98c7"         # AWS Linux 2023
instance_type   = "t3a.micro"                     # Change Instance type as needed
key_name        = "vsws-prod-bys"                 # Create a keypair manually via console and give the name of the keypair here
instance_subnet = "curengo-prod-public-subnet-2a" # You can change this as needed for different deployments

// For RDS

db_instance_identifier  = "curengo-prod-rds"
engine                  = "postgres"
engine_version          = "16.1"
instance_class          = "db.t4g.small"
allocated_storage       = 20
master_username         = "curengomaster"
master_password         = "Hello_bys123"
db_parameter_group_name = "default.postgres16"
monitoring_role_arn     = "arn:aws:iam::087914590515:role/rds-monitoring-role" # Replace with your actual ARN
backup_retention_period = 3
backup_window           = "02:00-03:00"
maintenance_window      = "Sun:03:00-Sun:04:00"
deletion_protection     = true




