output "repository_urls" {
  description = "A map of repository names to their full registry URLs."
  value       = { for k, v in aws_ecr_repository.repo : k => v.repository_url }
}

output "repository_arns" {
  description = "A map of repository names to their ARNs."
  value       = { for k, v in aws_ecr_repository.repo : k => v.arn }
}
