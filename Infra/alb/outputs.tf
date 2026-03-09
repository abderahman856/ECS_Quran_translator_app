output "alb_dns_name" {
  description = "The public DNS name of the ALB."
  value       = aws_lb.main.dns_name
}

output "target_group_arn" {
  description = "The ARN of the target group to be used by the ECS service."
  value       = aws_lb_target_group.app.arn
}
