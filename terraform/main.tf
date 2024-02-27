# Configuração do provider AWS
provider "aws" {
  region = var.aws_region  # Define a região AWS para provisionamento
}

# Configuração da VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.66.0"
  
  name = var.vpc_name  # Define o nome da VPC
  cidr = var.vpc_cidr  # Define o bloco CIDR da VPC
}

# Configuração do Amazon S3 para armazenamento de arquivos de áudio
resource "aws_s3_bucket" "audio_files" {
  bucket = var.s3_bucket_name  # Define o nome do bucket S3
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# Configuração do Amazon ElastiCache Redis
resource "aws_elasticache_cluster" "redis_cluster" {
  cluster_id           = var.redis_cluster_id  # Define o ID do cluster ElastiCache Redis
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1

  subnet_group_name = module.vpc.default_subnet_group_name
}

# Configuração do Amazon RDS (MySQL)
resource "aws_db_instance" "rds_instance" {
  identifier              = var.rds_identifier
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t2.micro"
  name                    = var.rds_name
  username                = var.rds_username
  password                = var.rds_password
  publicly_accessible     = false
  skip_final_snapshot     = true
  backup_retention_period = 7

  vpc_security_group_ids = [module.vpc.default_security_group_id]

  db_subnet_group_name   = module.vpc.default_subnet_group_name
}

# Configuração do AWS ECS (Elastic Container Service)
resource "aws_ecs_cluster" "ecs_cluster" {
  name = "spotmusic-ecs-cluster"
}

# Configuração do ECR (Elastic Container Registry)
resource "aws_ecr_repository" "spotmusic_repo" {
  name = "spotmusic-repo"
  image_scanning_configuration {
    scan_on_push = true
  }
}

# Configuração do AWS Secrets Manager
resource "aws_secretsmanager_secret" "db_secrets" {
  name = var.secrets_manager_secret_name  # Define o nome do segredo no Secrets Manager
}

resource "aws_secretsmanager_secret_version" "db_secrets_version" {
  secret_id   = aws_secretsmanager_secret.db_secrets.id
  secret_string = jsonencode({
    username = var.secrets_manager_secret_username,  # Define o nome de usuário no segredo
    password = var.secrets_manager_secret_password,  # Define a senha no segredo
  })
}

# Configuração da definição de tarefa ECS para a API Web
resource "aws_ecs_task_definition" "web_api_task" {
  family                   = "spotmusic-web"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name  = "spotmusic-web-api-container"
      image = "your_registry/spotmusic-web-api:latest"
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        },
      ]
    },
  ])
}

# Configuração da API Gateway
resource "aws_api_gateway_rest_api" "api_gateway" {
  name        = "spotmusic-api-gateway"
  description = "API for SpotMusic"
}

# Configuração do CloudFront
resource "aws_cloudfront_distribution" "cdn_distribution" {
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = "audio-files-origin"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"  # Redireciona HTTP para HTTPS
  }

  origin {
    domain_name = aws_s3_bucket.audio_files.bucket_regional_domain_name
    origin_id   = "audio-files-origin"
  }

  enabled = true
}