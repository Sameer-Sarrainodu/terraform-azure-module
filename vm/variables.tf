variable "resource_group_name" {}
variable "location" {}

variable "admin_username" {}
variable "ssh_public_key" {}

variable "vm_map" {
  description = "Map of VM definitions"
  type = map(object({
    subnet_id = string
    size      = string
  }))
}

variable "tags" {
  type    = map(string)
  default = {}
}