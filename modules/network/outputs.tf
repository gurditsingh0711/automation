output "vnet" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet" {
  value = azurerm_subnet.subnet.name
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}
