output "alb_dns_name" {
  description = "Point your Cloudflare API subdomain CNAME record to this value."
  value       = module.alb.alb_dns_name
}

output "cloudfront_domain_name" {
  description = "Point your Cloudflare root domain CNAME record to this value."
  value       = module.cloudfront.cloudfront_domain_name
}

output "acm_validation_record_name" {
  description = "Add this CNAME name to Cloudflare to validate your ACM certificate."
  value       = module.acm.validation_record_name
}

output "acm_validation_record_value" {
  description = "Add this CNAME value to Cloudflare to validate your ACM certificate."
  value       = module.acm.validation_record_value
}
