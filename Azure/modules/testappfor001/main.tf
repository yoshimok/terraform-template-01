locals {
  resource_group_name = "maedatest01"

  resource_group_region = "japaneast"

  mysql_name = "testsql"
}

resource "azurerm_resource_group" "rg_test" {
  name     = local.resource_group_name
  location = local.resource_group_region
}

resource "azurerm_mysql_server" "example" {
  name                = local.mysql_name
  location            = azurerm_resource_group.rg_test.location
  resource_group_name = azurerm_resource_group.rg_test.name

  administrator_login          = "mysqladminun"
  administrator_login_password = "p4ssw0rd"

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = var.mysql_version

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = false
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}