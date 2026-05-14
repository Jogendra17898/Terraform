resource "azurerm_resource_group" "rg1005" {
    name = "${var.environment}-rg1005"
    location = var.location
  
}