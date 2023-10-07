locals {
  app_services = [
    {
      kind = "Linux"
      sku = {
        tier = "Standard"
        size = "S1"
      }
    },
    {
      kind = "Windows"
      sku = {
        tier = "Basic"
        size = "B1"
      }
    }
  ]
}

resource "azurerm_app_service_plan" "app_svc_plan" {
  count               = length(local.app_services)
  name                = "${lower(local.app_services[count.index].kind)}-asp"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  kind                = local.app_services[count.index].kind
  app_service_environment_id = azurerm_app_service_environment_v3.app_svc_env.id
  reserved            = true

  sku {
    tier = local.app_services[count.index].sku.tier
    size = local.app_services[count.index].sku.size
  }
}


resource "azurerm_app_service" "app_service_li" {
  name                = "dotnet-li-appservice"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.app_svc_plan[0].id

  site_config {
    dotnet_framework_version = "v4.0"
  }
}

resource "azurerm_app_service" "app_service_win" {
  name                = "dotnet-win-appservice"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.app_svc_plan[1].id

  site_config {
    dotnet_framework_version = "v4.0"
  }
}