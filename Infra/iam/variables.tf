variable "project_name" {
  description = "The name of the project, used to prefix and identify IAM roles."
  type        = string
  default     = "quran-app"
}

variable "environment" {
  description = "The deployment environment (dev, staging, prod) to ensure unique naming across accounts."
  type        = string
}
