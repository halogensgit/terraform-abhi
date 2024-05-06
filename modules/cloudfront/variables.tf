variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket used as the origin for the CloudFront distribution."
}

variable "domain_names" {
  type        = list(string)
  description = "List of alternate domain names (CNAMEs) for the CloudFront distribution."
}

variable "acm_certificate_arn" {
  type        = string
  description = "The ARN of the ACM SSL certificate to use with CloudFront."
}

variable "oai_comment" {
  type        = string
  description = "Comment for the Origin Access Identity."
}

variable "route53_zone_id" {
  type        = string
  description = "The Route 53 Hosted Zone ID where DNS records will be created for validation."
}
