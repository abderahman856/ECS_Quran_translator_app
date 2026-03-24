output "cloudfront_domain_name" {
  description = "The CloudFront distribution domain name."
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "cloudfront_distribution_arn" {
  description = "The ARN of the CloudFront distribution."
  value       = aws_cloudfront_distribution.s3_distribution.arn
}
