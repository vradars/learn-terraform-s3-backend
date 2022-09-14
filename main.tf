terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.30.0"
    }
  }

  backend "s3" {
    bucket = "learn-terraform-state-backend"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform_state"
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "terraform-training"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "vpc"
  }
}