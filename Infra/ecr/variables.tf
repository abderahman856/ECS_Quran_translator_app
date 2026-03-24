variable "project_name" {
  description = "The name of the project, used for resource tagging."
  type        = string
  default     = "quran-app"
}

variable "environment" {
  description = "The deployment environment (dev, prod)."
  type        = string
}

variable "repository_names" {
  description = "A list of ECR repository names to create."
  type        = set(string)
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository."
  type        = string
  default     = "IMMUTABLE"
}

variable "untainted_image_retention_count" {
  description = "The number of tagged images to keep before the lifecycle policy expires them."
  type        = number
  default     = 20
}
