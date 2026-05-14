variable "name" {}

variable "resource_group_name" {}

variable "location" {}

variable "subnet_id" {}

variable "admin_username" {}

variable "ssh_public_key" {}

variable "vm_size" {
  default = "Standard_D2s_v3"
}

variable "tags" {
  type    = map(string)
  default = {}
}