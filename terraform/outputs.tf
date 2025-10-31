output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.app_bucket.bucket
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.app_bucket.arn
}

output "bucket_endpoint" {
  description = "LocalStack endpoint for the S3 bucket"
  value       = "http://localhost:4566/${aws_s3_bucket.app_bucket.bucket}"
}
