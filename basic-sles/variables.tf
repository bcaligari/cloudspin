variable "az_resource_group" {
  description = "Azure resource group"
  type        = string
  default     = "rg-bc-simple-sles"
}

variable "az_location" {
  description = "Azure location for resources"
  type        = string
  default     = "westeurope"
}

variable "az_vm_default_size" {
  description = "Default size for disposable VMs"
  type        = string
  default     = "Standard_B1ms"
}

variable "admin_user" {
  description = "Default admin user"
  type        = string
  default     = "sysop"
}

variable "admin_key" {
  description = "Default admin user SSH key path"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "az_source_image" {
  description = "Default source image to spin up"
  type        = map(string)

  default = {
    publisher = "suse"
    offer     = "sles-sap-15-sp2-byos"
    sku       = "gen2"
    version   = "latest"
  }
}

variable "project_tags" {
  description = "Tags for this project"
  type        = map(string)

  default = {
    owner  = "Brendon Caligari"
    status = "in use"
  }
}
