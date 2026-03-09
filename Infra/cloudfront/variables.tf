variable "project_name" {
  description = "Project name for resource naming."
  type        = string
}

variable "environment" {
  description = "Environment (dev/prod)."
  type        = string
}

variable "s3_bucket_id" {
  description = "The ID of the S3 bucket to use as the CloudFront origin."
  type        = string
}

variable "s3_bucket_regional_domain_name" {
  description = "The regional domain name of the S3 bucket (used by CloudFront origin)."
  type        = string
}

variable "domain_name" {
  description = "Your custom domain name (e.g., quranapp.com). Must match the ACM cert."
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate for this domain. Must be in us-east-1 for CloudFront."
  type        = string
}
