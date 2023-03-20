variable "vm_count" {
  type = number
}

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "subnet_id" {
 
}

variable "tags" {
  type = map(string)
}

variable "linux_vm_ids" {
  type = list(string)
}

variable "vmwindows_vm_id" {
  type = string
}

variable "account_type" {
  type = string
}

variable "datadisk_size" {
  type = number
}

