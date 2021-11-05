locals {
  vm_name = "cameron-test"
}

module "linux_vm_test" {
  source                  = "../../modules/linux-vm-from-template/"
  vsphere_server          = ""
  vsphere_user            = var.vsphere_user
  vsphere_password        = var.vsphere_password
  vsphere_vm_name         = ""
  vsphere_template_name   = ""
  vsphere_datacenter      = ""
  vsphere_datastore       = ""
  vsphere_num_cpus        = 2
  vsphere_memory          = 4096
  vsphere_guest_id        = "centos7_64Guest"
  vsphere_vm_network      = ""
  vsphere_compute_cluster = ""
  vsphere_vapp            = ""
}

# store variables in a auto.tfvars to load seperately
variable "vsphere_user" {
  default     = ""
  description = "User for vSphere API operations."
}
variable "vsphere_password" {
  default     = ""
  description = "Password for vSphere API operations."
}
