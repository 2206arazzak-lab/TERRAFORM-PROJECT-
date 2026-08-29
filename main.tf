terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  common_tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr              = "10.0.0.0/16"
  public_subnet_cidr    = "10.0.1.0/24"
  availability_zone     = "us-east-1a"
  vpc_name              = "terraform-demo-vpc"
  public_subnet_name    = "terraform-demo-public-subnet"
  internet_gateway_name = "terraform-demo-igw"
  route_table_name      = "terraform-demo-public-rt"

  common_tags = local.common_tags
}

module "s3" {
  source = "./modules/s3"

  bucket_name = "admin-terraform-demo-2026-830"

  common_tags = local.common_tags
}

module "ec2" {
  source = "./modules/ec2"

  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_id

  instance_type = "t3.micro"

  key_name        = "terraform-demo-key"
  public_key_path = "C:/Users/ADMIN/.ssh/terraform-demo.pub"

  ssh_cidr = "49.123.45.67/32"

  security_group_name = "terraform-demo-ec2-sg"
  instance_name       = "terraform-demo-ec2"

  common_tags = local.common_tags
}

output "bucket_name" {
  value = module.s3.bucket_name
}

output "bucket_arn" {
  value = module.s3.bucket_arn
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}
