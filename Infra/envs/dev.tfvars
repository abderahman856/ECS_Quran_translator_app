project_name = "quran-app"
environment  = "dev"
aws_region   = "us-east-1"

domain_name = "dev.baashe.uk"

container_image = "723580626973.dkr.ecr.us-east-1.amazonaws.com/quran-app-backend:v1.0.3"
container_port  = 5000
cpu             = "256"
memory          = "512"
desired_count   = 1

vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]

repository_names                = ["backend"]
image_tag_mutability            = "MUTABLE"
untainted_image_retention_count = 5

bucket_name = "frontend"

log_retention_days = 7

cloudflare_zone_id   = "cd3eac2e6b369e227006b156d6aaca40"
cloudflare_api_token = "5o2G0frlgMldtmle8Iz23cH61bTzQgSHBtXKXaIq"
