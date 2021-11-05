variable "vsphere_user" {
  type        = string
  description = "User for vSphere API operations."
  default     = ""
}

variable "vsphere_password" {
  type        = string
  description = "Password for vSphere API operations."
  default     = ""
}

variable "vsphere_server" {
  type        = string
  description = "vCenter server name for vSphere API operations."
  default     = ""
}

variable "vsphere_datacenter" {
  type        = string
  description = "vSphere datacenter used in data source."
  default     = ""
}

variable "vsphere_datastore" {
  type        = string
  description = "vSphere datastore used in data source."
  default     = ""
}

#variable "vsphere_resource_pool" {
#  type    = string
#}

variable "vsphere_vm_name" {
  type        = string
  description = "Virtual machine name for the created resource."
  default     = ""
}

variable "vsphere_num_cpus" {
  type        = number
  description = "Number os CPU cores for the created VM. (Not the number of sockets. That defaults to 1.)"
  default     = 2
}

variable "vsphere_memory" {
  type        = number
  description = "Amount or memory in MB for the VM."
  default     = 4096
}

# https://code.vmware.com/apis/196/vspherehttps://vdc-repo.vmware.com/vmwb-repository/dcr-public/6b586ed2-655c-49d9-9029-bc416323cb22/fa0b429a-a695-4c11-b7d2-2cbc284049dc/doc/vim.vm.GuestOsDescriptor.GuestOsIdentifier.html
variable "vsphere_guest_id" {
  type        = string
  description = "Guest ID for the operating system type."
  default     = ""
}

variable "vsphere_template_name" {
  type        = string
  description = "Name for the template to clone."
  default     = ""
}

variable "vsphere_vm_network" {
  type        = string
  description = "vSpere network name which the VM will use."
}

variable "vsphere_compute_cluster" {
  type        = string
  description = "vSphere compute cluster for the VM."
  default     = ""
}

variable "vsphere_vapp" {
  type        = string
  description = "Default vApp for the VM. A vsphere_resource_pool will be needed for resource pools/"
  default     = ""
}

