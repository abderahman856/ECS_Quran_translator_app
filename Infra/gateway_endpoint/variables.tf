variable "vpc_id" {
  description = "The ID of the VPC where the Gateway Endpoint will be created."
  type        = string
}

variable "private_route_table_ids" {
  description = "List of private route table IDs to associate with the S3 endpoint."
  type        = list(string)
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)."
  type        = string
}
