provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_compute_cluster" "compute_cluster" {
  name          = var.vsphere_compute_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_vm_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_vapp_container" "pool" {
  name          = var.vsphere_vapp
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vsphere_template_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vsphere_vm_name
  resource_pool_id = data.vsphere_vapp_container.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.vsphere_num_cpus
  memory   = var.vsphere_memory
  guest_id = var.vsphere_guest_id

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  # I used NFS templates mount where tested. This forced all images to thick provisioned.
  # Terraform doesn't allow changing disk types, so you will have to have a separate template on a seprate datastore to avoid.
  # Therefore no custimation on the disk allowed.
  # https://github.com/hashicorp/terraform-provider-vsphere/issues/935
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      network_interface {}

      windows_options {
        computer_name = var.vsphere_vm_name
        workgroup     = "test.internal"
      }
    }
  }
}
