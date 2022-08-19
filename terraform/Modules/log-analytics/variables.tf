variable la-rg {
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
}

variable "location" {
  default = "westeurope"
}

variable "environment" {
}
variable retention {
  default = 30
  }
variable log_analytics_workspace_name {
}
variable "daily_quota_gb" {
}
