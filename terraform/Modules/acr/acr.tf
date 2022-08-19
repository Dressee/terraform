resource "azurerm_resource_group" "acr_resource_group" {
  name     = var.acr-rg
  location = var.location
 
  tags = {
    Environment = var.environment
  }
}
 
resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = azurerm_resource_group.acr_resource_group.name
  location            = azurerm_resource_group.acr_resource_group.location
  sku                 = "Basic"
  admin_enabled       = false
 
  tags = {
    Environment = var.environment
  }
}