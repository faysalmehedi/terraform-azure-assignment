resource_group_name     = "terraform-azure-poc"
location                = "Central India"
virtual_network_name    = "poc_vnet"
appgw_subnet_name       = "appgw_subnet"

appgw_name              = "appgwtfpoc01"
appgw_pip_name          = "appgwpip"
appgw_sku_name          = "Standard_Small"
appgw_sku_capacity      = "Standard"
appgw_sku_tier          = 2

tags = {
  createdWith = "Terraform",
  environment = "dev",
  createdBy = "Faysal Mehedi"
}

