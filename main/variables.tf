variable "project_name" {
  description = "Name of the project, used to prefix resources"
  type        = string
}

variable "region" {
  description = "AWS region to deploy resources into"
  type        = string
}

variable "aws_region" {
  type        = string
  description = "AWS region for the ALB certificate."
  default     = "ap-northeast-2" // Your default AWS region
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}


variable "subnets" {
  description = "Map of subnet configurations"
  type = map(object({
    cidr : string
    az : string
    route_table : string
  }))
}

variable "environment_name" {
  description = "The name of the environment (prod, staging, dev, etc.)"
  type        = string
}

variable "domain_name" {
  type        = string
  description = "The domain name for which the ACM certificate will be issued."
}

variable "route53_zone_id" {
  type        = string
  description = "The Route 53 Hosted Zone ID for DNS validation."
}

variable "bucket_name" {
  description = "Name of the S3 bucket to be used by CloudFront"
}

variable "cloudfront_domain_names" {
  description = "List of alternate domain names (CNAMEs) for the CloudFront distribution."
  type        = list(string)
}


variable "office_ip" {
  description = "CIDR block for the office IP to allow SSH access to EC2"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the instance."
  type        = string
}


variable "instance_type" {
  description = "The type of instance to start."
  type        = string
}

variable "key_name" {
  description = "The key pair name to attach to the instance."
  type        = string
}


variable "instance_subnet" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}


variable "db_instance_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
}

variable "engine" {
  description = "The type of database engine to use"
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine to use"
  type        = string
}

variable "instance_class" {
  description = "The instance type to use"
  type        = string
}

variable "allocated_storage" {
  description = "The amount of storage allocated to the RDS instance"
  type        = number
}



variable "master_username" {
  description = "The master username for the RDS instance"
  type        = string
}

variable "master_password" {
  description = "The master password for the RDS instance"
  type        = string
  sensitive   = true
}




variable "db_parameter_group_name" {
  description = "The name of the DB parameter group"
  type        = string
}

variable "monitoring_role_arn" {
  description = "The ARN of the IAM role for enhanced monitoring"
  type        = string
}

variable "backup_retention_period" {
  description = "The number of days to retain backups"
  type        = number
}

variable "backup_window" {
  description = "The daily time range during which automated backups are created"
  type        = string
}

variable "maintenance_window" {
  description = "The weekly time range during which system maintenance can occur"
  type        = string
}

variable "deletion_protection" {
  description = "Specifies whether to enable deletion protection for the RDS instance"
  type        = bool
}
