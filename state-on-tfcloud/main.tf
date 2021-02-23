terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.29"
    }
  }

  backend "remote" {
    organization = "xxxxxxx"

    workspaces {
      name = "Mega-Workspace"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "tftest"
  }
}
