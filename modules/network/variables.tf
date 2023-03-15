variable "rg_name" {
  default = "N01478647-assignment1-RG"
}

variable "location" {
  description = "Location of the resources."
  default = "eastus"
}

variable "subnet" {
  description = "Name of the subnet."
  default = "subnet1"
}

variable "tags" {
  type = map(string)
  default = {
    Project = "Automation Project – Assignment 1"
    Name = "gurdit.singh"
    ExpirationDate = "2023-06-30"
    Environment = "Lab"
  }
}

variable "vnet" {
  default = "8647vnet"
}

variable "address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_address_prefix" {
  description = "CIDR block for the subnet."
  default = "10.0.1.0/24"
}
