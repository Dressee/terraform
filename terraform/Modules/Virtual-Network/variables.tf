variable "virtual_network_name" {
    type = string
    description = "name of the virtual network"
}
variable "network-rg" {
    type = string
    description = "resource group name of the virtual network"
}
variable "virtual_network_address_space" {
    type = list(string)
    description = "address space of the virtual network"
}
variable "location" {
    type = string
    description = "location of the virtual network"
}
variable "aks_subnet_name" {
    type = string
    description = "name of the subnet"
}
variable "aks_subnet_address_prefixes" {
    type = list(string)
    description = "address prefix of the subnet"
}
variable "environment" {
}  
variable "ingress_subnet_address_prefixes" {
    type = list(string)
    description = "address prefix of the subnet"
}
variable "gateway_subnet_address_prefixes" {
    type = list(string)
    description = "address prefix of the subnet"
}
variable "ingress_subnet_name" {
    type = string
    description = "name of the subnet"
}    
variable "gateway_subnet_name" {
    type = string
    description = "name of the subnet"
}