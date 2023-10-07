resource "azurerm_route_table" "rt" {
  name                = var.route_table_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  tags                = var.tags
  depends_on          = [ azurerm_firewall.firewall ]

  route {
    name                   = "kubenetfw_fw_r"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.firewall.ip_configuration[0].private_ip_address
  }

}

resource "azurerm_subnet_route_table_association" "subnet_association" {
  subnet_id      = data.azurerm_subnet.appservice_subnet.id
  route_table_id = azurerm_route_table.rt.id
}