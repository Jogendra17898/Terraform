terraform {
    backend "azurerm" {
        resource_group_name = "js_bhai"
        storage_account_name = "storagejs2026"
        container_name = "jsstore"
        key = "js1.terraform.tfstate"
    }
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "4.65.0"
      }
    }
}

provider "azurerm" {
    features {}
}