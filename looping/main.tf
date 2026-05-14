resource "azurerm_resource_group" "rg1008" { #just want to use count
    count = length(var.rg_name)
    name     = var.rg_name[count.index]
    location =var.rg_location
}


resource "azurerm_resource_group" "rg1009" { #just want to practice with map

  for_each = var.resource_groups

  name     = each.key
  location = each.value
}