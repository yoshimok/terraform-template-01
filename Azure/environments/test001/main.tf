provider "azurerm" {
  version         = "~>2.20.0"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.sp_client_id}"
  client_secret   = "${var.sp_client_secret}"
  tenant_id       = "${var.sp_tenant_id}"
  features {}
}

locals {
  location = "japaneast"

  resource_group_name = "maedatest01"
}

resource "azurerm_resource_group" "rsg" {
  name     = local.resource_group_name
  location = local.location
}

module "webapp" {
  source              = "../../modules/appService001"
  app_name            = "maedatest"
  location            = local.location
  resource_group_name = azurerm_resource_group.rsg.name
}

module "sqldb" {
  source              = "../../modules/sql001"
  sql_name            = "maedatest"
  location            = local.location
  resource_group_name = azurerm_resource_group.rsg.name
}

