data "azurerm_resource_group" "existing" {
	name = "N01478647-assignment1-RG"
}

resource "azurerm_resource_group" "rgroup" {
  name     = "N01478647-assignment1-RG"
  location = "eastus"
  
  tags = {
    Environment    = "Lab"
    ExpirationDate = "2023-06-30"
    Name           = "gurdit.singh"
    Project        = "Automation Project – Assignment 1"
  }
}

