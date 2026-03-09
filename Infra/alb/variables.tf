variable "project_name" {
  description = "Project name used for resource naming and tagging."
  type        = string
}

variable "environment" {
  description = "Environment (dev/prod) for resource naming."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the ALB and Target Group will reside."
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs where the ALB will be deployed."
  type        = list(string)
}

variable "alb_sg_id" {
  description = "The Security Group ID for the ALB (allows port 80/443)."
  type        = string
}

variable "certificate_arn" {
  description = "The ARN of the ACM certificate for HTTPS listeners."
  type        = string
}
