resource_group_name                 = "terraform-azure-poc"
virtual_network_name                = "poc_vnet"
delegated_subnet_name               = "psql_delegated"
psql_server_name                    = "psqldemopoc01"
sku_name                            = "GP_Standard_D8ads_v5"
storage_mb                          = "32768"
backup_retention_days               = 7
psql_version                        = "15"
geo_redundant_backup_enabled        = false
zone                                = "1"
public_network_access_enabled       = false
administrator_login                 = "psqladmin"
charset                             = "UTF8"
collation                           = "en_US.utf8"
db_names                            = ["poc-db"]

tags = {
  createdWith = "Terraform",
  environment = "dev",
  createdBy = "Faysal Mehedi"
}