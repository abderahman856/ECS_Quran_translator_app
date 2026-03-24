## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.acm_validation](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.api](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.root](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.www](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_validation_record_name"></a> [acm\_validation\_record\_name](#input\_acm\_validation\_record\_name) | CNAME name for ACM certificate DNS validation. From acm module output. | `string` | n/a | yes |
| <a name="input_acm_validation_record_value"></a> [acm\_validation\_record\_value](#input\_acm\_validation\_record\_value) | CNAME value for ACM certificate DNS validation. From acm module output. | `string` | n/a | yes |
| <a name="input_alb_dns_name"></a> [alb\_dns\_name](#input\_alb\_dns\_name) | ALB DNS name for the backend API. From alb module output. | `string` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | Your Cloudflare Zone ID. | `any` | n/a | yes |
| <a name="input_cloudfront_domain_name"></a> [cloudfront\_domain\_name](#input\_cloudfront\_domain\_name) | CloudFront distribution domain name. | `string` | n/a | yes |
| <a name="input_dns_record_name"></a> [dns\_record\_name](#input\_dns\_record\_name) | Root DNS record name. Use 'dev' for dev, '@' for prod. | `string` | `"@"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_record_hostname"></a> [api\_record\_hostname](#output\_api\_record\_hostname) | The api subdomain CNAME record hostname. |
| <a name="output_root_record_hostname"></a> [root\_record\_hostname](#output\_root\_record\_hostname) | The root domain CNAME record hostname. |
| <a name="output_www_record_hostname"></a> [www\_record\_hostname](#output\_www\_record\_hostname) | The www subdomain CNAME record hostname. |
