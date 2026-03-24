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
  description = "The regional domain name of the S3 bucket."
  type        = string
}

variable "domain_name" {
  description = "My custom domain name."
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate for this domain."
  type        = string
}
