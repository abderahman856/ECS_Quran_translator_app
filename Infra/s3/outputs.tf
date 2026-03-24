output "bucket_id" {
  description = "The ID of the frontend S3 bucket."
  value       = aws_s3_bucket.app_data.id
}

output "bucket_arn" {
  description = "The ARN of the frontend S3 bucket."
  value       = aws_s3_bucket.app_data.arn
}

output "bucket_regional_domain_name" {
  description = "The regional domain name of the S3 bucket."
  value       = aws_s3_bucket.app_data.bucket_regional_domain_name
}

output "logs_bucket_id" {
  description = "The ID of the S3 access logs bucket."
  value       = aws_s3_bucket.logs.id
}
