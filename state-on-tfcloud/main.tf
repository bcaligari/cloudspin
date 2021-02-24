terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.29"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.46.0"
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

provider "azurerm" {
  features {
  }
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "tftest"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-bc-tfcloudtest"
  location = "westeurope"

  tags     = {
    owner = "Brendon Caligari"
    status = "in use"
  }
}

resource "azurerm_virtual_network" "vnet" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  name                = "vnet-default"
  address_space       = ["172.16.0.0/16"]
}
