output "s3_endpoint_id" {
  description = "The ID of the S3 Gateway Endpoint."
  value       = aws_vpc_endpoint.s3.id
}
