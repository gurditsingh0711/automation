
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default = {
    Project        = "Automation Project – Assignment 1"
    Name           = "gurdit.singh"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}
variable "rg_name" {}
variable "location" {}
variable "lb_backend_pool_name" {
  default = "backend-pool"
}
variable "lb_probe_port" {
  default = 80
}
variable "linux_vm_ids"{
  type = list(string)
}
