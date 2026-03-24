
variable "project_name" {
  description = "The name of the project."
  type        = string
  default     = "quran-app"
}

variable "environment" {
  description = "Deployment environment (dev, prod)."
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region to create the state bucket in."
  type        = string
  default     = "us-east-1"
}
