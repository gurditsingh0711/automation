variable "tags" {
  type    = map(string)
}

variable "resource_group_name" {
  type    = string
}

variable "location" {
  type    = string 
}


variable "vnet_name" {
  type    = string
}

variable "subnet_name" {
  type    = string
}

variable "vm_size" {
  type    = string
}

variable "vm_count" {
  type    = number
}

variable "dns_label_prefix" {
  type    = string
}

variable "ssh_user" {
  type    = string
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "subnet_id" {
  type = string
}

variable "storage_account_uri" {
}
