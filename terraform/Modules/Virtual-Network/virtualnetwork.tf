resource "azurerm_resource_group" "vnet_resource_group" {
  name     = var.network-rg
  location = var.location
 
  tags = {
    Environment = var.environment
  }
}
resource "azurerm_virtual_network" "vnet" {
  name                        = var.virtual_network_name
  resource_group_name         = azurerm_resource_group.vnet_resource_group.name
  location                    = var.location
  address_space               = var.virtual_network_address_space
  tags = {
    Environment = var.environment
  }
}
resource "azurerm_subnet" "aks_subnet" {
  name                    = var.aks_subnet_name
  resource_group_name     = azurerm_resource_group.vnet_resource_group.name
  virtual_network_name    = azurerm_virtual_network.vnet.name
  address_prefixes        = var.aks_subnet_address_prefixes
}
resource "azurerm_subnet" "ingress_subnet" {
  name                    = var.ingress_subnet_name
  resource_group_name     = azurerm_resource_group.vnet_resource_group.name
  virtual_network_name    = azurerm_virtual_network.vnet.name
  address_prefixes        = var.ingress_subnet_address_prefixes
}
resource "azurerm_subnet" "gateway_subnet" {
  name                    = var.gateway_subnet_name
  resource_group_name     = azurerm_resource_group.vnet_resource_group.name
  virtual_network_name    = azurerm_virtual_network.vnet.name
  address_prefixes        = var.gateway_subnet_address_prefixes
}

