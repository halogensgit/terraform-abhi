output "vpc_id" {
  value = module.vpc.vpc_id
}

output "cloudfront_certificate_arn" {
  description = "The ARN of the ACM certificate used for CloudFront."
  value       = module.acm.cloudfront_certificate_arn
}

output "alb_certificate_arn" {
  description = "The ARN of the ACM certificate used for ALB."
  value       = module.acm.alb_certificate_arn
}


output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution"
  value       = module.cloudfront.cloudfront_distribution_id
}

output "cloudfront_distribution_domain" {
  description = "The domain name of the CloudFront distribution"
  value       = module.cloudfront.cloudfront_distribution_domain
}

output "ec2_ssm_role_arn" {
  value       = module.iam_role_ec2_ssm.iam_role_arn
  description = "The ARN of the IAM role for EC2 SSM"
}

output "alb_arn" {
  description = "The ARN of the ALB"
  value       = module.alb.alb_arn
}

output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = module.alb.alb_dns_name
}
