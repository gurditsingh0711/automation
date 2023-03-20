terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-RG"
    storage_account_name = "storageacc8647"
    container_name       = "tfstate-container"
    key                  = "79Os6Q55W9GKH9JFZ/TI9MAzfbzXxFEE0xu6Cpkpa9S5q6qy8bhLMdMGsSSQzKlWbMLOLSHaH9fh+AStBYrWQQ=="
  }
}
