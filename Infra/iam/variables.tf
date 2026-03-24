variable "project_name" {
  description = "The name of the project, used to prefix and identify IAM roles."
  type        = string
  default     = "quran-app"
}

variable "environment" {
  description = "The deployment environment."
  type        = string
}
