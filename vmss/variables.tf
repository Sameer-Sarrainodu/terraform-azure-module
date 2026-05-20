variable "resource_group_name" {}
variable "location" {}

variable "admin_username" {}
variable "ssh_public_key" {}

variable "backend_pool_map" {
  type = map(list(string))
}

variable "vmss_map" {
  description = "Map of VMSS services"

  type = map(object({
    subnet_id = string
    vm_size   = string
    instances = number
  }))
}

variable "tags" {
  type    = map(string)
  default = {}
}