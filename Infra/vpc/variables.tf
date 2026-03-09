variable "project_name" {
  description = "The name of the project, used for resource naming and tagging."
  type        = string
}

variable "environment" {
  description = "The deployment environment (dev, prod)."
  type        = string
}

variable "vpc_cidr" {
  description = "The primary IPv4 CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for the private subnets."
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "availability_zones" {
  description = "AWS Availability Zones to distribute subnets for high availability."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}
