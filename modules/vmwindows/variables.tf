variable "tags" {
  type        = map(string)
}


variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "subnet_id" {
}

variable "vm_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "os_disk_name" {
  type = string
}

variable "os_type" {
  type = string
}

variable "dns_label" {
  type = string
}

variable "avail_set_name" {
  type = string
}

variable "public_ip_dns_label" {
  type = string
}

variable "antimalware_extension_name" {
  type = string
}

variable "antimalware_extension_publisher" {
  type = string
}

variable "antimalware_extension_type" {
  type = string
}

variable "antimalware_extension_version" {
  type = string
}

variable "boot_diagnostics_storage_uri" {

}
