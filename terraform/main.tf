terraform {
  required_providers {
    azurerm = {
        source  = "hashicorp/azurerm"
        version = "=3.15.1"
    }
  }
  backend "azurerm" {
    resource_group_name     = "rg-db-weu-x-tf01"
    storage_account_name    = "dbterraform"
    container_name          = "tfstatedevops"
    key                     = "terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
}
/*
resource "azurerm_resource_group" "rg" {
   name     = var.resource_group_name
   location = var.location
}
*/
module "Virtual-Network" {
  source = "./Modules/Virtual-Network"
  virtual_network_name            = "vn-weu-p-net-01"
  network-rg                      = "rg-weu-p-net-01"
  location                        = "westeurope"
  virtual_network_address_space   = ["172.16.0.0/16"]
  aks_subnet_name                 = "subnet-aks"
  aks_subnet_address_prefixes     = ["172.16.0.0/24"]
  ingress_subnet_name             = "subnet-ingress"
  ingress_subnet_address_prefixes = ["172.16.1.0/24"]
  gateway_subnet_name             = "subnet-gateway"
  gateway_subnet_address_prefixes = ["172.16.2.0/24"]

  environment                     = "Production"
}

module "acr" {
  source   = "./Modules/acr"
  name     = "acrweupgeneral"
  acr-rg   = "rg-weu-p-acr-01"
  environment = "development"
}

module "loganalytics"{
  source = "./Modules/log-analytics"
  log_analytics_workspace_name = "la-weu-p-la-39"
  la-rg = "rg-weu-p-la-01"
  log_analytics_workspace_sku = "PerGB2018"
  environment = "Production"
  daily_quota_gb = 0.1
}

module "aks"{
  source = "./Modules/aks"
  name = "aks-weu-p-infra-01"
  aks-rg = "rg-weu-p-aks-01"
  kubernetes_version = "1.22.11"
  agent_count = 1
  vm_size = "standard_d2as_v5"

  
  log_analytics_workspace_id = module.loganalytics.Log_Analytics_WorkSpace_id
  agic_subnet_id = module.Virtual-Network.gateway_subnet_id
  aks_subnet = module.Virtual-Network.aks_subnet_id
  environment = "Production"

}