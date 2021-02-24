terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.46.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.29"
    }
  }
}

provider "azurerm" {
  features {
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "azurerm_resource_group" "az_rg" {
  name     = "rg-bc-tftest"
  location = "westeurope"

  tags = {
    owner  = "Brendon Caligari"
    status = "in use"
  }
}

resource "azurerm_virtual_network" "az_vnet" {
  resource_group_name = azurerm_resource_group.az_rg.name
  location            = azurerm_resource_group.az_rg.location
  name                = "vnet-default"
  address_space       = ["172.16.0.0/16"]
}

resource "azurerm_subnet" "az_snet_default" {
  resource_group_name  = azurerm_resource_group.az_rg.name
  virtual_network_name = azurerm_virtual_network.az_vnet.name
  name                 = "snet-default"
  address_prefixes     = ["172.16.0.0/24"]
}

resource "azurerm_subnet" "az_snet_oob" {
  resource_group_name  = azurerm_resource_group.az_rg.name
  virtual_network_name = azurerm_virtual_network.az_vnet.name
  name                 = "snet-oob"
  address_prefixes     = ["172.16.1.0/24"]
}

resource "aws_vpc" "aws_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "tftest"
  }
}

resource "aws_subnet" "aws_snet" {
  vpc_id     = aws_vpc.aws_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "tftest-ooa"
  }
}
