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
  default     = "ap-northeast-2"
}
