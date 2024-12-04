# Main Terraform File
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"
}

# Security Module
module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

# Application Module
module "application" {
  source       = "./modules/application"
  vpc_id       = module.vpc.vpc_id
  security_sg  = module.security.app_sg_id
  public_subnets  = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
}

# Database Module
module "database" {
  source          = "./modules/database"
  private_subnets = module.vpc.private_subnets
  private_sg_id   = module.security.db_sg_id
  db_username     = "admin"  # Replace with your desired username
  db_password     = "securepassword"  # Replace with a strong password
}


# Monitoring Module
module "monitoring" {
  source = "./modules/monitoring"
  instance_id = module.application.frontend_instance_id

}

# CI/CD Pipeline Module
module "pipeline" {
  source = "./modules/pipeline"
  repository_name = "my-repo-name"
  branch_name     = "main" # Specify the required branch name here
  region          = "us-east-1"
}

# VPC Outputs
output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the VPC"
}

output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "List of public subnet IDs"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "List of private subnet IDs"
}

# Security Outputs
output "app_sg_id" {
  value       = module.security.app_sg_id
  description = "The ID of the security group for the application"
}

output "db_sg_id" {
  value       = module.security.db_sg_id
  description = "The ID of the security group for the database"
}

# Application Outputs
output "frontend_instance_id" {
  value       = module.application.frontend_instance_id
  description = "The ID of the frontend EC2 instance"
}

output "backend_instance_id" {
  value       = module.application.backend_instance_id
  description = "The ID of the backend EC2 instance"
}

output "alb_arn" {
  value       = module.application.alb_arn
  description = "The ARN of the Application Load Balancer"
}

# Data Outputs
output "rds_endpoint" {
  value       = module.database.db_endpoint
  description = "The endpoint of the RDS database"
}

output "s3_bucket_name" {
  value       = module.database.s3_bucket_name
  description = "The name of the S3 bucket for storing data"
}

# Pipeline Outputs
output "pipeline_s3_bucket" {
  value       = module.pipeline.pipeline_artifacts_bucket
  description = "The name of the S3 bucket used for pipeline artifacts"
}

output "pipeline_name" {
  value       = module.pipeline.pipeline_name
  description = "The name of the CodePipeline project"
}

# Monitoring Outputs
output "cloudwatch_log_group_name" {
  value       = module.monitoring.cloudwatch_log_group_name
  description = "The name of the CloudWatch log group"
}

output "guardduty_detector_id" {
  value       = module.monitoring.guardduty_detector_id
  description = "The ID of the GuardDuty detector"
}

output "waff" {
    value = module.waf.web_acl_arn
}