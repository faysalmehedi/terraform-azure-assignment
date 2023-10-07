variable "tags" {
  default = {}
  type    = map(string)
}

variable "resource_group_name" {}
variable "virtual_network_name" {}
variable "firewall_subnet_name" {}
variable "appservice_subnet_name" {}

variable "pip_name" {}
variable "fw_name" {}
variable "zones" {}
variable "threat_intel_mode" {}
variable "sku_name" {}
variable "sku_tier" {}
variable "route_table_name" {}
