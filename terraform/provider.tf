provider "aws" {
  region              = "us-east-1"
  allowed_account_ids = ["590184089630"]
  profile             = "default"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-training-jaume"
    key    = "EKS_hello_world.tfstate"
    region = "us-east-1"
  }

  required_version = "~> 1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.33.0"
    }
  }
}