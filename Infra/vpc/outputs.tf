output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "List of IDs for the public subnets."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "List of IDs for the private subnets."
  value       = aws_subnet.private[*].id
}

output "private_route_table_ids" {
  description = "List of private route table IDs (used by the S3 Gateway Endpoint)."
  value       = [aws_route_table.private.id]
}
