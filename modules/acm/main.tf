provider "aws" {
  region = "us-east-1" # Provider for CloudFront certificate
  alias  = "us-east-1"
}

provider "aws" {
  region = var.aws_region # Provider for ALB certificate
  alias  = "default"
}

resource "aws_acm_certificate" "cloudfront_cert" {
  provider                  = aws.us-east-1
  domain_name               = var.domain_name
  validation_method         = "DNS"
  subject_alternative_names = ["*.${var.domain_name}"]
  key_algorithm             = "EC_prime256v1"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate" "alb_cert" {
  provider                  = aws.default
  domain_name               = var.domain_name
  validation_method         = "DNS"
  subject_alternative_names = ["*.${var.domain_name}"]
  key_algorithm             = "EC_prime256v1"


  lifecycle {
    create_before_destroy = true
  }
}

locals {
  unique_validation_options_cloudfront = { for dvo in aws_acm_certificate.cloudfront_cert.domain_validation_options :
    dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  unique_validation_options_alb = { for dvo in aws_acm_certificate.alb_cert.domain_validation_options :
    dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
}

resource "aws_route53_record" "cloudfront_cert_validation" {
  provider        = aws.us-east-1
  for_each        = local.unique_validation_options_cloudfront
  allow_overwrite = true
  name            = each.value.name
  type            = each.value.type
  records         = [each.value.record]
  ttl             = 60
  zone_id         = var.route53_zone_id
}

resource "aws_route53_record" "alb_cert_validation" {
  provider        = aws.default
  for_each        = local.unique_validation_options_alb
  allow_overwrite = true
  name            = each.value.name
  type            = each.value.type
  records         = [each.value.record]
  ttl             = 60
  zone_id         = var.route53_zone_id
}
