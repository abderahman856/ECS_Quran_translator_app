variable "cloudflare_zone_id" {
  description = "Your Cloudflare Zone ID."
}

variable "cloudfront_domain_name" {
  description = "CloudFront distribution domain name."
  type        = string
}

variable "alb_dns_name" {
  description = "ALB DNS name for the backend API. From alb module output."
  type        = string
}

variable "acm_validation_record_name" {
  description = "CNAME name for ACM certificate DNS validation. From acm module output."
  type        = string
}

variable "acm_validation_record_value" {
  description = "CNAME value for ACM certificate DNS validation. From acm module output."
  type        = string
}

variable "dns_record_name" {
  description = "Root DNS record name. Use 'dev' for dev, '@' for prod."
  type        = string
  default     = "@"
}