# bootstrap/oidc/variables.tf

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "quran-app"
}

variable "github_org" {
  description = "GitHub username or organization name"
  type        = string
  default     = "abderahman856"
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
  default     = "ECS_Quran_translator_app"
}

variable "state_bucket" {
  description = "S3 bucket name used for Terraform state"
  type        = string
  default     = "quran-app-dev-terraform-state"
}
