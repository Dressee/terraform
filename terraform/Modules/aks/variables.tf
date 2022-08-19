variable "name" {
}
variable "aks-rg" {
}
variable "location" {
  default = "westeurope"
}
/*
variable "ssh_public_key" {
  default = "id_rsa.pub"
}
*/
variable "kubernetes_version" {
}

variable "agent_count" {
}

variable "vm_size" {
}

variable "dns_prefix" {
    default = "cck8s"
}
variable "aks_admins_group_object_id" {
  default = "9eaa8f4f-fb7e-470c-9409-abea6872a987"
}
/*
variable "addons" {
  description = "Defines which addons will be activated."
  type = object({
    oms_agent            = bool,
    azure_policy         = bool,
    ingress_application_gateway = bool
  })
}
*/
variable log_analytics_workspace_id {
}

variable aks_subnet {
}

variable agic_subnet_id {
}

variable "environment" {
}
