
resource "azurerm_resource_group" "rgroup" {
  name     = "N01478647-assignment1-RG"
  location = var.location
  tags = var.tags
}

