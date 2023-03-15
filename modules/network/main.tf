resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.rg_name
  tags = var.tags
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefix]
}
