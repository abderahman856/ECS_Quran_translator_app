project_name = "quran-app"
environment  = "staging"
aws_region   = "us-east-1"

domain_name = "staging.baashe.uk"

container_image = "723580626973.dkr.ecr.us-east-1.amazonaws.com/quran-app-backend:rc-1.0.0"
container_port  = 5000
cpu             = "512"
memory          = "1024"
desired_count   = 1

vpc_cidr             = "10.1.0.0/16"
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_cidrs = ["10.1.10.0/24", "10.1.11.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]

repository_names                = ["backend"]
image_tag_mutability            = "IMMUTABLE"
untainted_image_retention_count = 5

bucket_name = "frontend"

log_retention_days = 14

cloudflare_zone_id   = ""
cloudflare_api_token = ""
