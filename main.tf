module "rgroup" {
  source = "./modules/rgroup"
}

module "network" {
  source = "./modules/network"

  rg_name = "N01478647-assignment1-RG"
  tags = var.tags
}

module "common" {
  source = "./modules/common"
  rg_name = "N01478647-assignment1-RG"
  location = "eastus"
  tags                = var.tags
}

module "vmlinux" {
  source   = "./modules/vmlinux"
  vm_count = 2
  vm_size  = "Standard_B1s"
  ssh_user = "centos"
  
  subnet_id   = module.network.subnet_id
  vnet_name   = module.network.vnet
  subnet_name = module.network.subnet
  storage_account_uri = module.common.storage_account_uri
}

module "vmwindows" {
  source                          = "./modules/vmwindows"
  rg_name   		          = "N01478647-assignment1-RG"
  location                        = "eastus"
  subnet_id                       = module.network.subnet_id
  vm_name                         = "vm-windows"
  vm_size                         = "Standard_B1s"
  admin_username                  = "adminuser"
  admin_password                  = "Gurditsingh8647"
  os_disk_name                    = "osdisk-windows"
  os_type                         = "Windows"
  dns_label                       = "public-ipwindows"
  avail_set_name                  = "8647windows-avail-set"
  public_ip_dns_label             = "win8647publicip"
  antimalware_extension_name      = "IaaSAntimalware"
  antimalware_extension_publisher = "Microsoft.Azure.Security"
  antimalware_extension_type      = "IaaSAntimalware"
  antimalware_extension_version   = "1.3"
  boot_diagnostics_storage_uri    = module.common.storage_account_uri

}

module "datadisk" {
  source              = "./modules/datadisk"
  location            = "eastus"
  rg_name = "N01478647-assignment1-RG"
  subnet_id           = module.network.subnet_id
  vm_count            = 3
  tags                = var.tags
  linux_vm_ids        = module.vmlinux.vm_ids
  vmwindows_vm_id     = module.vmwindows.vm_id
}


module "loadbalancer" {
  source              = "./modules/loadbalancer"
  rg_name = "N01478647-assignment1-RG"
  location            = "eastus"
  linux_vm_ids 	      = module.vmlinux.vm_nic_ids

}


module "database" {
  source              = "./modules/database"
  prefix              = "n8647"
  location            = "eastus"
  rg_name = "N01478647-assignment1-RG"
  db_name             = "mydatabase"
  db_admin_username   = "adminuser"
  db_admin_password   = "Gurditsingh@8647"
}


