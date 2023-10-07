resource_group_name     = "terraform-azure-poc"
virtual_network_name    = "poc_vnet"
firewall_subnet_name    = "AzureFirewallSubnet"
appservice_subnet_name  = "appservice_subnet"

pip_name            = "fw_pip"
fw_name             = "fw_app"
zones               = ["1", "2"]
threat_intel_mode   = "Alert"
sku_name            = "AZFW_VNet"
sku_tier            = "Standard"
route_table_name    = "app_rt"


tags = {
  createdWith = "Terraform",
  environment = "dev",
  createdBy = "Faysal Mehedi"
}