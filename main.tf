module "rgroup" {
  source = "./modules/rgroup"
  location = "eastus"
  tags = {
    Environment    = "Lab"
    ExpirationDate = "2023-06-30"
    Name           = "gurdit.singh"
    Project        = "Automation Project – Assignment 2"
  }
}

module "network" {
  source = "./modules/network"
  
  vnet                  = "8647vnet"
  address_space         = ["10.0.0.0/16"]
  subnet                = "subnet"
  subnet_address_prefix = ["10.0.1.0/24"]
  rg_name               = "N01478647-assignment1-RG"
  location              = "eastus"
  tags = {
    Environment    = "Lab"
    ExpirationDate = "2023-06-30"
    Name           = "gurdit.singh"
    Project        = "Automation Project – Assignment 2"
  }
  depends_on = [
  module.rgroup
  ]
}
 
module "common" {
  source = "./modules/common"

  rg_name = "N01478647-assignment1-RG"
  location = "eastus"
  la_workspace_name = "la-workspace8647"
  log_sku = "PerGB2018"
  rs_vault_name = "rs-vault8647"
  vault_sku = "Standard"
  st_name = "st8647"
  st_tier = "Standard"
  st_replication_type = "LRS"
  tags = {
    Environment    = "Lab"
    ExpirationDate = "2023-06-30"
    Name           = "gurdit.singh"
    Project        = "Automation Project – Assignment 2"
  }
  depends_on = [
  module.rgroup
  ]
}

module "vmlinux" {
  source   = "./modules/vmlinux"
  
  resource_group_name = "N01478647-assignment1-RG"
  location = "eastus"
  vm_count = 2
  vm_size  = "Standard_B1s"
  ssh_user = "centos"
  dns_label_prefix = "8647"
  subnet_id   = module.network.subnet_id
  vnet_name   = module.network.vnet
  subnet_name = module.network.subnet
  storage_account_uri = module.common.storage_account_uri
  tags = {
    Environment    = "Lab"
    ExpirationDate = "2023-06-30"
    Name           = "gurdit.singh"
    Project        = "Automation Project – Assignment 2"
  }
  depends_on = [
  module.rgroup
  ]
}

module "vmwindows" {
  source                          = "./modules/vmwindows"
  rg_name   		          = "N01478647-assignment1-RG"
  location                        = "eastus"
  subnet_id                       = module.network.subnet_id
  vm_name                         = "vm-windows"
  vm_size                         = "Standard_B1s"
  admin_username                  = "adminuser"
  admin_password                  = "Gurditsingh@8647"
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
  tags = {
    Environment    = "Lab"
    ExpirationDate = "2023-06-30"
    Name           = "gurdit.singh"
    Project        = "Automation Project – Assignment 2"
  }
  depends_on = [
  module.rgroup
  ]
}

module "datadisk" {
  source              = "./modules/datadisk"
  location            = "eastus"
  rg_name             = "N01478647-assignment1-RG"
  subnet_id           = module.network.subnet_id
  vm_count            = 3
  linux_vm_ids        = module.vmlinux.vm_ids
  vmwindows_vm_id     = module.vmwindows.vm_id
  account_type        = "Standard_LRS"
  datadisk_size       = 10
  tags = {
    Environment    = "Lab"
    ExpirationDate = "2023-06-30"
    Name           = "gurdit.singh"
    Project        = "Automation Project – Assignment 2"
  }
  depends_on = [
  module.rgroup
  ]
}


module "loadbalancer" {
  source              = "./modules/loadbalancer"
  rg_name             = "N01478647-assignment1-RG"
  location            = "eastus"
  linux_vm_ids 	    = module.vmlinux.vm_nic_ids
  lb_probe_port	    = 80
  lb_backend_pool_name  = "backend-pool"
  tags = {
    Environment    = "Lab"
    ExpirationDate = "2023-06-30"
    Name           = "gurdit.singh"
    Project        = "Automation Project – Assignment 2"
  }
  depends_on = [
  module.rgroup
  ]
}


module "database" {
  source              = "./modules/database"
  prefix              = "n8647"
  location            = "eastus"
  rg_name             = "N01478647-assignment1-RG"
  db_name             = "mydatabase"
  db_admin_username   = "adminuser"
  db_admin_password   = "Gurditsingh@8647"
  db_sku_name         = "B_Gen5_1"
  db_storage_mb       = 5120
  tags = {
    Environment    = "Lab"
    ExpirationDate = "2023-06-30"
    Name           = "gurdit.singh"
    Project        = "Automation Project – Assignment 2"
  }
  depends_on = [
  module.rgroup
  ]
}

resource "null_resource" "ansible" {
  provisioner "local-exec" {
	command = "wsl ansible-playbook -i /home/gurdit/automation/ansible/assignment2/hosts /home/gurdit/automation/ansible/assignment2/groupX-playbook.yaml "
}	
}



