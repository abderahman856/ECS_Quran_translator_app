output "certificate_arn" {
  description = "The ARN of the validated certificate. Used by ALB and CloudFront."
  value       = aws_acm_certificate_validation.cert.certificate_arn
}

output "validation_record_name" {
  description = "The NAME of the CNAME record to add to Cloudflare for validation."
  value       = element(tolist(aws_acm_certificate.cert.domain_validation_options), 0).resource_record_name
}

output "validation_record_value" {
  description = "The VALUE of the CNAME record to add to Cloudflare for validation."
  value       = element(tolist(aws_acm_certificate.cert.domain_validation_options), 0).resource_record_value
}
