variable "rg_name" {
	type = string
}

variable "location" {
	type = string
}

variable "tags" {
  type = map(string)
}

variable "la_workspace_name" {
	type = string
}

variable "log_sku" {
	type = string
}

variable "rs_vault_name" {
	type = string
}

variable "vault_sku" {
	type = string
}

variable "st_name" {
	type = string
}

variable "st_tier" {
	type = string
}

variable "st_replication_type" {
	type = string
}
