variable "tags" {
  default = {}
  type    = map(string)
}

variable "resource_group_name" {}
variable "virtual_network_name" {}
variable "appservice_subnet_name" {}
variable "appservice_env_name" {}
variable "app_01_name" {}
variable "appservice_plan_name" {}
