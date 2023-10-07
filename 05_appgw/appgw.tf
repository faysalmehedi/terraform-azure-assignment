locals {
  backend_probe_name = "appgw-probe"
  http_setting_name  = "appgw-be-htst"
}

resource "azurerm_public_ip" "appgw_pip" {
  name                = var.appgw_pip_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
}

resource "azurerm_application_gateway" "appgw" {
  depends_on          = [azurerm_public_ip.example]
  name                = var.appgw_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location

  sku {
    name     = var.appgw_sku_name
    tier     = var.appgw_sku_tier
    capacity = var.appgw_sku_capacity
  }

  gateway_ip_configuration {
    name      = "appgw-ip-configuration"
    subnet_id = data.azurerm_subnet.appgw_subnet.id
  }

  frontend_port {
    name = "appgw-fe-port"
    port = 8080
  }

  frontend_ip_configuration {
    name                 = "appgw-feip"
    public_ip_address_id = azurerm_public_ip.appgw_pip.id
  }

  backend_address_pool {
    name = "dotnet-li-appservice"
    fqdns = [ data.azurerm_app_service.app_service_li.default_site_hostname ]
  }

  backend_address_pool {
    name = "dotnet-win-appservice"
    fqdns = [ data.azurerm_app_service.app_service_win.default_site_hostname ]
  }

  probe {
    name                                      = local.backend_probe_name
    protocol                                  = "Http"
    path                                      = "/"
    interval                                  = 30
    timeout                                   = 120
    unhealthy_threshold                       = 3
    pick_host_name_from_backend_http_settings = true
    match {
      body        = "Welcome"
      status_code = [200, 399]
    }
  }

  backend_http_settings {
    name                                = local.http_setting_name
    probe_name                          = local.backend_probe_name
    cookie_based_affinity               = "Disabled"
    path                                = "/"
    port                                = 80
    protocol                            = "Http"
    request_timeout                     = 120
    pick_host_name_from_backend_address = true
  }


  http_listener {
    name                           = "dotnet-li-appservice-httplstn"
    frontend_ip_configuration_name = "appgw-feip"
    frontend_port_name             = "appgw-fe-port"
    protocol                       = "Http"
  }

  http_listener {
    name                           = "dotnet-win-appservice-httplstn"
    frontend_ip_configuration_name = "appgw-feip"
    frontend_port_name             = "appgw-fe-port"
    protocol                       = "Http"
  }

  
  request_routing_rule {
    name                       = "dotnet-li-appservice-rqrt"
    rule_type                  = "Basic"
    http_listener_name         = "dotnet-li-appservice-httplstn"
    backend_address_pool_name  = "dotnet-li-appservice"
    backend_http_settings_name = local.http_setting_name
  }

  request_routing_rule {
    name                       = "dotnet-win-appservice-rqrt"
    rule_type                  = "Basic"
    http_listener_name         = "dotnet-win-appservice-httplstn"
    backend_address_pool_name  = "dotnet-win-appservice"
    backend_http_settings_name = local.http_setting_name
  }
}