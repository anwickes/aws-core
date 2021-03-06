terraform {
  required_version = ">=1.2.3"
  backend "s3" {
    bucket         = "anwickes-personal-tfstate"
    key            = "terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "anwickes-personal-tfstate-lock"
    encrypt        = true
  }
}

provider "aws" {
  region  = "ap-southeast-2"
  version = "~> 4.20.0"
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "anwickes-personal-vpc"
  }
}
