module "vpc" {
  source               = "./vpc"
  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "security_groups" {
  source       = "./security_groups"
  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id
}

module "acm" {
  source      = "./acm"
  domain_name = var.domain_name
  environment = var.environment
}

module "alb" {
  source            = "./alb"
  project_name      = var.project_name
  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security_groups.alb_security_group_id
  certificate_arn   = module.acm.certificate_arn
}

module "s3" {
  source                      = "./s3"
  project_name                = var.project_name
  environment                 = var.environment
  bucket_name                 = "frontend"
  cloudfront_distribution_arn = module.cloudfront.cloudfront_distribution_arn
}

module "cloudfront" {
  source                         = "./cloudfront"
  project_name                   = var.project_name
  environment                    = var.environment
  s3_bucket_id                   = module.s3.bucket_id
  s3_bucket_regional_domain_name = module.s3.bucket_regional_domain_name
  domain_name                    = var.domain_name
  certificate_arn                = module.acm.certificate_arn
}

module "cloudwatch" {
  source           = "./cloudwatch"
  project_name     = var.project_name
  environment      = var.environment
  ecs_cluster_name = module.ecs.cluster_name
  ecs_service_name = module.ecs.service_name
}

module "iam" {
  source       = "./iam"
  project_name = var.project_name
  environment  = var.environment
}

module "ecs" {
  source                    = "./ecs"
  project_name              = var.project_name
  environment               = var.environment
  aws_region                = var.aws_region
  cpu                       = "256"
  memory                    = "512"
  container_port            = 5000
  container_image           = var.container_image
  execution_role_arn        = module.iam.ecs_task_execution_role_arn
  task_role_arn             = module.iam.ecs_task_role_arn
  private_subnet_ids        = module.vpc.private_subnet_ids
  ecs_sg_id                 = module.security_groups.ecs_tasks_security_group_id
  alb_target_group_arn      = module.alb.target_group_arn
  cloudwatch_log_group_name = module.cloudwatch.log_group_name
}

module "s3_gateway_endpoint" {
  source                  = "./gateway_endpoint"
  vpc_id                  = module.vpc.vpc_id
  environment             = var.environment
  private_route_table_ids = module.vpc.private_route_table_ids
}

module "ecr" {
  source           = "./ecr"
  project_name     = var.project_name
  environment      = var.environment
  repository_names = toset(["backend"])
}

module "cloudflare_dns" {
  source                      = "./cloudflare"
  cloudflare_zone_id          = var.cloudflare_zone_id
  cloudfront_domain_name      = module.cloudfront.cloudfront_domain_name
  alb_dns_name                = module.alb.alb_dns_name
  acm_validation_record_name  = module.acm.validation_record_name
  acm_validation_record_value = module.acm.validation_record_value
  dns_record_name             = var.environment == "prod" ? "@" : var.environment
}
