terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.60"
    }
  }

  backend "azurerm" {
      resource_group_name  = "tfstate"
      storage_account_name = "tfstateaksdemo"
      container_name       = "02-firewall-state"
      key                  = "terraform.tfstate"
    }

}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_subnet" "firewall_subnet" {
  name                 = var.firewall_subnet_name
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = var.virtual_network_name
}

data "azurerm_subnet" "appservice_subnet" {
  name                 = var.appservice_subnet_name
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = var.virtual_network_name
}
