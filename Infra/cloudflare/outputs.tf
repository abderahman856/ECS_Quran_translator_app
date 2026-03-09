output "root_record_hostname" {
  description = "The root domain CNAME record hostname."
  value       = cloudflare_record.root.hostname
}

output "www_record_hostname" {
  description = "The www subdomain CNAME record hostname."
  value       = cloudflare_record.www.hostname
}

output "api_record_hostname" {
  description = "The api subdomain CNAME record hostname."
  value       = cloudflare_record.api.hostname
}