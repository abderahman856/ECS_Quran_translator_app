variable "project_name" {
  description = "The name of the project for naming resources."
  type        = string
}

variable "environment" {
  description = "The deployment environment (dev, staging, prod)."
  type        = string
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster to monitor."
  type        = string
}

variable "ecs_service_name" {
  description = "The name of the ECS service to monitor."
  type        = string
}

variable "log_retention_days" {
  description = "Number of days to retain log events."
  type        = number
  default     = 30
}
