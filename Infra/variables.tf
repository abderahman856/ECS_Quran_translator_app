variable "project_name" {
  description = "The name of the project. Used as a prefix for all resource names."
  type        = string
  default     = "quran-app"
}

variable "environment" {
  description = "Deployment environment (dev, staging, or prod)."
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy all resources into."
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "My custom domain."
  type        = string
}

variable "container_image" {
  description = "Full ECR image URI for the backend container."
  type        = string
}

variable "container_port" {
  description = "Port the backend container listens on."
  type        = number
  default     = 5000
}

variable "cpu" {
  description = "ECS task CPU units."
  type        = string
  default     = "256"
}

variable "memory" {
  description = "ECS task memory in MiB."
  type        = string
  default     = "512"
}

variable "desired_count" {
  description = "Number of ECS tasks to run."
  type        = number
  default     = 1
}

variable "repository_names" {
  description = "Set of ECR repository names to create."
  type        = set(string)
  default     = ["backend"]
}

variable "image_tag_mutability" {
  description = "ECR tag mutability. MUTABLE for dev, IMMUTABLE for staging and prod."
  type        = string
  default     = "IMMUTABLE"
}

variable "untainted_image_retention_count" {
  description = "Number of tagged images to keep in ECR before expiring old ones."
  type        = number
  default     = 5
}

variable "bucket_name" {
  description = "Name suffix for the S3 frontend bucket."
  type        = string
  default     = "frontend"
}

variable "log_retention_days" {
  description = "Number of days to retain CloudWatch log events."
  type        = number
  default     = 30
}

variable "cloudflare_zone_id" {
  description = "Your Cloudflare Zone ID."
  type        = string
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token with DNS edit permissions."
  type        = string
  sensitive   = true
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets."
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones to deploy subnets into."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}
