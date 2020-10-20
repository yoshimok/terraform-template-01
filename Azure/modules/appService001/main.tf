locals {
  appservice_name = "testapp"
}

## https://www.terraform.io/docs/providers/azurerm/r/app_service.html
resource "azurerm_app_service_plan" "this" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "this" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.this.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}
