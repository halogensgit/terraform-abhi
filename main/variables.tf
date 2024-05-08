variable "project_name" {
  description = "Name of the project, used to prefix resources"
  type        = string
}

variable "region" {
  description = "AWS region to deploy resources into"
  type        = string
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

variable "aws_region" {
  type        = string
  description = "AWS region for the ALB certificate."
  default     = "ap-northeast-2" // Your default AWS region
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



