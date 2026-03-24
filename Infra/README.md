# Quran App Infrastructure
 ## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm"></a> [acm](#module\_acm) | ./acm | n/a |
| <a name="module_alb"></a> [alb](#module\_alb) | ./alb | n/a |
| <a name="module_cloudflare_dns"></a> [cloudflare\_dns](#module\_cloudflare\_dns) | ./cloudflare | n/a |
| <a name="module_cloudfront"></a> [cloudfront](#module\_cloudfront) | ./cloudfront | n/a |
| <a name="module_cloudwatch"></a> [cloudwatch](#module\_cloudwatch) | ./cloudwatch | n/a |
| <a name="module_ecr"></a> [ecr](#module\_ecr) | ./ecr | n/a |
| <a name="module_ecs"></a> [ecs](#module\_ecs) | ./ecs | n/a |
| <a name="module_iam"></a> [iam](#module\_iam) | ./iam | n/a |
| <a name="module_s3"></a> [s3](#module\_s3) | ./s3 | n/a |
| <a name="module_s3_gateway_endpoint"></a> [s3\_gateway\_endpoint](#module\_s3\_gateway\_endpoint) | ./gateway_endpoint | n/a |
| <a name="module_security_groups"></a> [security\_groups](#module\_security\_groups) | ./security_groups | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of availability zones to deploy subnets into. | `list(string)` | <pre>[<br/>  "us-east-1a",<br/>  "us-east-1b"<br/>]</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy all resources into. | `string` | `"us-east-1"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name suffix for the S3 frontend bucket. | `string` | `"frontend"` | no |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | Cloudflare API token with DNS edit permissions. Never commit this value. | `string` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | Your Cloudflare Zone ID. Found in Cloudflare dashboard → your domain → Overview → Zone ID. | `string` | n/a | yes |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | Full ECR image URI for the backend container (e.g., 123456789.dkr.ecr.us-east-1.amazonaws.com/quran-app-backend:v1.0.0). | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | Port the backend container listens on. | `number` | `5000` | no |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | ECS task CPU units (e.g., 256, 512). | `string` | `"256"` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | Number of ECS tasks to run. | `number` | `1` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Your custom domain (e.g., quranapp.com). Must be managed in Cloudflare. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment environment (dev, staging, or prod). | `string` | n/a | yes |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | ECR tag mutability. MUTABLE for dev, IMMUTABLE for staging and prod. | `string` | `"IMMUTABLE"` | no |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | Number of days to retain CloudWatch log events. | `number` | `30` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | ECS task memory in MiB (e.g., 512, 1024). | `string` | `"512"` | no |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | List of CIDR blocks for private subnets. | `list(string)` | <pre>[<br/>  "10.0.10.0/24",<br/>  "10.0.11.0/24"<br/>]</pre> | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project. Used as a prefix for all resource names. | `string` | `"quran-app"` | no |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | List of CIDR blocks for public subnets. | `list(string)` | <pre>[<br/>  "10.0.1.0/24",<br/>  "10.0.2.0/24"<br/>]</pre> | no |
| <a name="input_repository_names"></a> [repository\_names](#input\_repository\_names) | Set of ECR repository names to create. | `set(string)` | <pre>[<br/>  "backend"<br/>]</pre> | no |
| <a name="input_untainted_image_retention_count"></a> [untainted\_image\_retention\_count](#input\_untainted\_image\_retention\_count) | Number of tagged images to keep in ECR before expiring old ones. | `number` | `5` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The CIDR block for the VPC. | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_validation_record_name"></a> [acm\_validation\_record\_name](#output\_acm\_validation\_record\_name) | Add this CNAME name to Cloudflare to validate your ACM certificate. |
| <a name="output_acm_validation_record_value"></a> [acm\_validation\_record\_value](#output\_acm\_validation\_record\_value) | Add this CNAME value to Cloudflare to validate your ACM certificate. |
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | Point your Cloudflare API subdomain CNAME record to this value. |
| <a name="output_cloudfront_domain_name"></a> [cloudfront\_domain\_name](#output\_cloudfront\_domain\_name) | Point your Cloudflare root domain CNAME record to this value. |
