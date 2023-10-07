terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.60"
    }
  }

  # backend "azurerm" {
  #     resource_group_name  = "tfstate"
  #     storage_account_name = "tfstateaksdemo"
  #     container_name       = "01-basic-infra-state"
  #     key                  = "terraform.tfstate"
  #   }

}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}


