locals {
  resource_group_name = "Tableau"

  resource_group_region = "japaneast"

  mysql_name = "kikagaku"
}

resource "azurerm_resource_group" "this" {
  name     = local.resource_group_name
  location = local.resource_group_region
}

resource "azurerm_mysql_server" "this" {
  name                = local.mysql_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  administrator_login          = "mysqladminun"
  administrator_login_password = "P@ssw0rd"

  sku_name   = "GP_Gen5_4"
  storage_mb = 102400
  version    = var.mysql_version

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = false
}