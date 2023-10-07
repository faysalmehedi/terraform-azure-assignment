resource_group_name     = "terraform-azure-poc"
virtual_network_name    = "poc_vnet"
appservice_subnet_name  = "appservice_subnet"

appservice_env_name     = "appservicetfpoc01"
appservice_plan_name    = "serviceplantfpoc01"
app_01_name             = "tfpoc01pythonapp"

tags = {
  createdWith = "Terraform",
  environment = "dev",
  createdBy = "Faysal Mehedi"
}