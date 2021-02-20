variable "az_location" {
  description = "Azure location for resources"
  default     = "westeurope"
  type        = string
}

variable "vm_default_size" {
  description = "Default size for disposable VMs"
  default     = "Standard_B1ms"
  type        = string
}

variable "admin_user" {
  description = "Default admin user"
  default     = "sysop"
  type        = string
}

variable "admin_key" {
  description = "Default admin user SSH key path"
  default     = "~/.ssh/id_rsa.pub"
  type        = string
}

variable "source_image" {
  description = "Default source image to spin up"
  default = {
    publisher = "suse"
    offer     = "sles-sap-15-sp2-byos"
    sku       = "gen2"
    version   = "latest"
  }
}
