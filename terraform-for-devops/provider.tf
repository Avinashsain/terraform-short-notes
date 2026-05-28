terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "b15terraformbucket"  # Your bucket name
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-dynamodb-table"
  }
}

provider "aws" {
  region = "ap-south-1"
}