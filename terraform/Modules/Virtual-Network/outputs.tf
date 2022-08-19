output "gateway_subnet_id" {
    description = "id of the subnet"
    value = azurerm_subnet.gateway_subnet.id
}
output "aks_subnet_id" {
    description = "id of the subnet"
    value = azurerm_subnet.aks_subnet.id
}