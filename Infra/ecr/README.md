## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.repo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The deployment environment (dev, prod). | `string` | n/a | yes |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. | `string` | `"IMMUTABLE"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project, used for resource tagging. | `string` | `"quran-app"` | no |
| <a name="input_repository_names"></a> [repository\_names](#input\_repository\_names) | A list of ECR repository names to create (e.g., ['frontend', 'backend']). | `set(string)` | n/a | yes |
| <a name="input_untainted_image_retention_count"></a> [untainted\_image\_retention\_count](#input\_untainted\_image\_retention\_count) | The number of tagged images to keep before the lifecycle policy expires them. | `number` | `20` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_arns"></a> [repository\_arns](#output\_repository\_arns) | A map of repository names to their ARNs. |
| <a name="output_repository_urls"></a> [repository\_urls](#output\_repository\_urls) | A map of repository names to their full registry URLs. |
