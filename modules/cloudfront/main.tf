provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

# Declare the origin access identity resource
resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for ${var.bucket_name}"
}

# CloudFront distribution using a specific response headers policy
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = "${var.bucket_name}.s3.amazonaws.com"
    origin_id   = "${var.bucket_name}"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }
  enabled             = true
  default_root_object = "index.html"

  aliases = var.domain_names

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.bucket_name}"

    viewer_protocol_policy         = "redirect-to-https"
    compress                       = true
    cache_policy_id                = "658327ea-f89d-4fab-a63d-7e88639e58f6"  # Use CachingOptimized policy ID
    response_headers_policy_id     = "eaab4381-ed33-4a86-88ca-d9558dc6cd63"  # Managed policy ID for CORS with Preflight
  }

  price_class = "PriceClass_All"

  viewer_certificate {
    acm_certificate_arn            = var.acm_certificate_arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  custom_error_response {
    error_code            = 403
    response_page_path    = "/index.html"
    response_code         = 200
    error_caching_min_ttl = 10
  }
  
  
  http_version = "http2and3"
  is_ipv6_enabled = true
}
