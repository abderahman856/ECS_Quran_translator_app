output "ecs_task_execution_role_arn" {
  description = "The ARN of the ECS Task Execution Role (used for infrastructure/system tasks)"
  value       = aws_iam_role.ecs_task_execution_role.arn
}

output "ecs_task_role_arn" {
  description = "The ARN of the ECS Task Role (used for application-level AWS permissions)"
  value       = aws_iam_role.ecs_task_role.arn
}
