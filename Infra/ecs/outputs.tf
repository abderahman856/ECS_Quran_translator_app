output "cluster_name" {
  description = "The name of the ECS Cluster."
  value       = aws_ecs_cluster.main.name
}

output "service_name" {
  description = "The name of the ECS Service."
  value       = aws_ecs_service.main.name
}
