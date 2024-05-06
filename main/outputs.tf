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


