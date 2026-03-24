variable "project_name" {
  description = "The name of the project, used for resource naming and tagging."
  type        = string
}

variable "environment" {
  description = "The deployment environment."
  type        = string
}

variable "aws_region" {
  description = "The AWS region where resources are deployed."
  type        = string
  default     = "us-east-1"
}

variable "cpu" {
  description = "The number of CPU units used by the task."
  type        = string
  default     = "256"
}

variable "memory" {
  description = "The amount of memory used by the task."
  type        = string
  default     = "512"
}

variable "execution_role_arn" {
  description = "The ARN of the IAM role that allows ECS to pull images and write logs."
  type        = string
}

variable "task_role_arn" {
  description = "The ARN of the IAM role for the application container itself."
  type        = string
}

variable "container_image" {
  description = "The full URI of the Docker image stored in ECR."
  type        = string
}

variable "container_port" {
  description = "The port the container listens on."
  type        = number
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs where ECS tasks will run."
  type        = list(string)
}

variable "ecs_sg_id" {
  description = "The security group ID assigned to ECS tasks."
  type        = string
}

variable "alb_target_group_arn" {
  description = "The ARN of the ALB target group the ECS service registers with."
  type        = string
}

variable "desired_count" {
  description = "Number of task instances to keep running."
  type        = number
  default     = 1
}

variable "cloudwatch_log_group_name" {
  description = "The CloudWatch log group name for container logs."
  type        = string
}
