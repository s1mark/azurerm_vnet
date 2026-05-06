variable "vnet_name"             {}
variable "location"              {}
variable "resource_group_name"   {}
variable "vnet_address_space"    {}
variable "subnet_name"           {}
variable "subnet_address_prefix" {}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.vnet_address_space]
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefix]
}


output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
output "subnet_id" {
  value = azurerm_subnet.subnet.id
}
output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}
