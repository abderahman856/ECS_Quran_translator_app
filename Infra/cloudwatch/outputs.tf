output "log_group_name" {
  description = "The name of the CloudWatch log group to be used in ECS task definitions."
  value       = aws_cloudwatch_log_group.ecs.name
}
