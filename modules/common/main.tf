resource "azurerm_log_analytics_workspace" "la_workspace" {
  name                = var.la_workspace_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.log_sku
  tags 		    = var.tags
}

resource "azurerm_recovery_services_vault" "rs_vault" {
  name                = var.rs_vault_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.vault_sku
  tags                = var.tags
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.st_name
  location                 = var.location
  resource_group_name      = var.rg_name
  account_tier             = var.st_tier
  account_replication_type = var.st_replication_type
  tags 			   = var.tags
}
