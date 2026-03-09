variable "project_name" {
  description = "Name of the project for tagging and naming"
  type        = string
  default     = "quran-app"
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where SGs will be created"
  type        = string
}
