terraform {
  backend "azurerm" {
    resource_group_name  = "N01478647-assignment1-RG"
    storage_account_name = "tfstate8647"
    container_name       = "tfstate"
    key                  = "scx9LlBWgYYI6X0voblMljiD6xAw5Mpd+rRZiIqxbTIHHdyLUJRwxGwVsDFtFyyoyWUSMkaoW+6C+ASt1RLNVw=="
  }
}
