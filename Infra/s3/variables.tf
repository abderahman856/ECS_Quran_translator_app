variable "project_name" {
  description = "Name of the project for resource naming."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "bucket_name" {
  description = "Specific name for the S3 bucket."
  type        = string
}

variable "cloudfront_distribution_arn" {
  description = "The ARN of the CloudFront distribution allowed to access this bucket via OAC."
  type        = string
}
