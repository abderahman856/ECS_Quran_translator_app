resource "cloudflare_record" "root" {
  zone_id = var.cloudflare_zone_id
  name    = var.dns_record_name
  type    = "CNAME"
  content = var.cloudfront_domain_name
  proxied = false
  ttl     = 1
}

resource "cloudflare_record" "www" {
  zone_id = var.cloudflare_zone_id
  name    = var.dns_record_name == "@" ? "www" : "www.${var.dns_record_name}"
  type    = "CNAME"
  content = var.cloudfront_domain_name
  proxied = false
  ttl     = 1

  timeouts {
    create = "5m"
    update = "5m"
  }
}

resource "cloudflare_record" "api" {
  zone_id = var.cloudflare_zone_id
  name    = var.dns_record_name == "@" ? "api" : "api.${var.dns_record_name}"
  type    = "CNAME"
  content = var.alb_dns_name
  proxied = false
  ttl     = 1

  timeouts {
    create = "5m"
    update = "5m"
  }
}

resource "cloudflare_record" "acm_validation" {
  zone_id = var.cloudflare_zone_id
  name    = var.acm_validation_record_name
  type    = "CNAME"
  content = var.acm_validation_record_value
  proxied = false
  ttl     = 1
}
