
variable "tags" {
  type        = map(string)
}

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "lb_backend_pool_name" {
  type = string  
}

variable "lb_probe_port" {
  type = number
}

variable "linux_vm_ids"{
  type = list(string)
}
