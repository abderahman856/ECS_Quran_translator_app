output "cloudfront_domain_name" {
  description = "The CloudFront distribution domain name (point your Cloudflare CNAME here)."
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "cloudfront_distribution_arn" {
  description = "The ARN of the CloudFront distribution (used by the S3 bucket policy)."
  value       = aws_cloudfront_distribution.s3_distribution.arn
}
