variable "tags" {
  default = {}
  type    = map(string)
}

variable "resource_group_name" {}
variable "location" {}

variable "virtual_network_name" {}
variable "firewall_subnet_name" {}
variable "postgresql_subnet_name" {}
variable "appgw_subnet_name" {}
variable "appservice_subnet_name" {}