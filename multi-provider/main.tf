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
  alias  = "e1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "e2"
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

resource "aws_vpc" "e1_vpc" {
  provider   = aws.e1
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "tftest"
  }
}

resource "aws_subnet" "e1_snet" {
  provider   = aws.e1
  vpc_id     = aws_vpc.e1_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "tftest-ooa"
  }
}

resource "aws_vpc" "e2_vpc" {
  provider   = aws.e2
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "tftest"
  }
}

resource "aws_subnet" "e2_snet" {
  provider   = aws.e2
  vpc_id     = aws_vpc.e2_vpc.id
  cidr_block = "192.168.0.0/24"

  tags = {
    Name = "tftest-ooa"
  }
}
