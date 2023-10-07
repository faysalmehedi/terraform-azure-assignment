resource_group_name     = "terraform-azure-poc"
location                = "Central India"
virtual_network_name    = "poc_vnet"
firewall_subnet_name    = "AzureFirewallSubnet"
postgresql_subnet_name  = "psql_delegated"
appgw_subnet_name       = "appgw_subnet"
appservice_subnet_name  = "appservice_subnet"

tags = {
  createdWith = "Terraform",
  environment = "dev",
  createdBy = "Faysal Mehedi"
}