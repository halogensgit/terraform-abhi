output "cloudfront_certificate_arn" {
  description = "The ARN of the ACM certificate used for CloudFront."
  value       = aws_acm_certificate.cloudfront_cert.arn
}

output "alb_certificate_arn" {
  description = "The ARN of the ACM certificate used for ALB."
  value       = aws_acm_certificate.alb_cert.arn
}


output "cloudfront_cert_status" {
  value = aws_acm_certificate.cloudfront_cert.status
}

output "alb_cert_status" {
  value = aws_acm_certificate.alb_cert.status
}
