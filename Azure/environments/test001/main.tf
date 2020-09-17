
provider "azurerm" {
  version         = "~>2.10.0"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.sp_client_id}"
  client_secret   = "${var.sp_client_secret}"
  tenant_id       = "${var.sp_tenant_id}"
  features {}
}


module "test_mysql" {
  source = "../../modules/testappfor001"
  mysql_version = "8.0"
}

