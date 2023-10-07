variable "tags" {
  default = {}
  type    = map(string)
}

variable "resource_group_name" {}
variable "location" {}

variable "virtual_network_name" {}
variable "appgw_subnet_name" {}
variable "appgw_name" {}
variable "appgw_pip_name" {}
variable "appgw_sku_name" {}
variable "appgw_sku_tier" {}
variable "appgw_sku_capacity" {}
