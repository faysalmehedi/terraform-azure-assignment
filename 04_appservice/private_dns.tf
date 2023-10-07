resource "azurerm_private_dns_zone" "appsvc" {
  name                = "${var.appservice_env_name}.appserviceenvironment.net"
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "tfpocvnet"
  private_dns_zone_name = azurerm_private_dns_zone.appsvc.name
  virtual_network_id    = data.azurerm_virtual_network.poc_vnet.id
  resource_group_name   = data.azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_a_record" "example" {
  name                = "tfpocvnet"
  zone_name           = azurerm_private_dns_zone.appsvc.name
  resource_group_name = data.azurerm_resource_group.rg.name
  ttl                 = 300
  records             = azurerm_app_service_environment_v3.example.internal_inbound_ip_addresses
}

resource "azurerm_private_dns_a_record" "atdns" {
  name                = "@"
  zone_name           = azurerm_private_dns_zone.appsvc.name
  resource_group_name = data.azurerm_resource_group.rg.name
  ttl                 = 300
  records             = azurerm_app_service_environment_v3.example.internal_inbound_ip_addresses
}

resource "azurerm_private_dns_a_record" "stardns" {
  name                = "*"
  zone_name           = azurerm_private_dns_zone.appsvc.name
  resource_group_name = data.azurerm_resource_group.rg.name
  ttl                 = 300
  records             = azurerm_app_service_environment_v3.example.internal_inbound_ip_addresses
}

resource "azurerm_private_dns_a_record" "scmdns" {
  name                = "*.scm"
  zone_name           = azurerm_private_dns_zone.appsvc.name
  resource_group_name = data.azurerm_resource_group.rg.name
  ttl                 = 300
  records             = azurerm_app_service_environment_v3.example.internal_inbound_ip_addresses
}