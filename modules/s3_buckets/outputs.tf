output "bucket_name" {
  description = "The name of the frontend S3 bucket"
  value       = aws_s3_bucket.frontend.bucket
}
