resource "random_password" "postgres_password" {
  length  = 32
  special = true
}

resource "azurerm_private_dns_zone" "pdz" {
  name                = "${var.psql_server_name}.private.postgres.database.azure.com"
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "tfpocvnet"
  private_dns_zone_name = azurerm_private_dns_zone.pdz.name
  virtual_network_id    = data.azurerm_virtual_network.poc_vnet.id
  resource_group_name   = data.azurerm_resource_group.rg.name
}


resource "azurerm_postgresql_flexible_server" "psql" {
  name                         = var.psql_server_name
  location                     = data.azurerm_resource_group.rg.location
  resource_group_name          = data.azurerm_resource_group.rg.name
  sku_name                     = var.sku_name
  delegated_subnet_id          = data.azurerm_subnet.psql_subnet.id
  private_dns_zone_id          = azurerm_private_dns_zone.pdz.id
  storage_mb                   = var.storage_mb
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  zone                         = var.zone
  version                      = var.psql_version
  administrator_login          = var.administrator_login
  administrator_password       = random_password.postgres_password.result
  tags                         = var.tags
}


resource "azurerm_postgresql_flexible_server_database" "db" {
  for_each  = toset(var.db_names)
  name      = each.value
  server_id = azurerm_postgresql_flexible_server.psql.id
  charset   = var.charset
  collation = var.collation
}

