output "alb_dns_name" {
  description = "Point My Cloudflare API subdomain CNAME record to this value."
  value       = module.alb.alb_dns_name
}

output "cloudfront_domain_name" {
  description = "Point My Cloudflare root domain CNAME record to this value."
  value       = module.cloudfront.cloudfront_domain_name
}

output "acm_validation_record_name" {
  description = "Added this CNAME name to Cloudflare to validate My ACM certificate."
  value       = module.acm.validation_record_name
}

output "acm_validation_record_value" {
  description = "Added this CNAME value to Cloudflare to validate My ACM certificate."
  value       = module.acm.validation_record_value
}
