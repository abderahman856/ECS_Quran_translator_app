
variable "domain_name" {
  description = "The domain name purchased at Cloudflare."
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, prod). Used for resource tagging."
  type        = string
}
