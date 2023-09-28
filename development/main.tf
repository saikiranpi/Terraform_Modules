provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = "<= 2.0.14" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 5.0.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "saikiranbucket94"
    key    = "dev-modules.tfstate"
    region = "us-east-1"
  }
}