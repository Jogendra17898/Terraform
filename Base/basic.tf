terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.65.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "sg-yogi"
    storage_account_name = "storageaccountys"
    container_name       = "tfb18"
    key                  = "test.terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "dddeployment" {
  name     = "drdo"
  location = "centralindia"
}

#Implicit Dependencies
resource "azurerm_storage_account" "storedata" {
  name                     = "drdodefence"
  resource_group_name      = azurerm_resource_group.dddeployment.name
  location                 = azurerm_resource_group.dddeployment.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Explicit Dependencies

resource "azurerm_storage_account" "storemoney" {
  depends_on               = [azurerm_resource_group.dddeployment]
  name                     = "moddefence"
  resource_group_name      = "drdo"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "store" {
  name                  = "storeing"
  storage_account_id    = azurerm_storage_account.storedata.id
  container_access_type = "private"
}
