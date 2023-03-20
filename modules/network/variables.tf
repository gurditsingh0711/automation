variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "vnet" {
  type = string
}

variable "address_space" {
}

variable "subnet_address_prefix" {
}
