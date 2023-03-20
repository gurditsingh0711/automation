
variable "db_name" {
  type = string
}

variable "db_sku_name" {
  type = string
}

variable "db_storage_mb" {
  type = number
}

variable "db_admin_username" {
  type = string
}

variable "db_admin_password" {
  type = string
}

variable "rg_name"{
  type = string
}

variable "location"{
  type = string
}

variable "prefix"{
  type = string
}

variable "tags" {
 type = map(string)
}
