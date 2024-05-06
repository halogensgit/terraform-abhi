resource "aws_s3_bucket" "frontend" {
  bucket = "${var.project_name}-frontend-s3"

  # Public access blocking configuration
}

# Block all public access using the aws_s3_bucket_public_access_block resource
resource "aws_s3_bucket_public_access_block" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Server-side encryption configuration 
resource "aws_s3_bucket_server_side_encryption_configuration" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Disable versioning via aws_s3_bucket_versioning if needed
resource "aws_s3_bucket_versioning" "frontend" {
  bucket = aws_s3_bucket.frontend.id
  versioning_configuration {
    status = "Suspended"
  }
}
