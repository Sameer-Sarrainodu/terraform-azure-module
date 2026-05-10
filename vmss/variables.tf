variable "name" {}
variable "resource_group_name" {}
variable "location" {}

variable "subnet_id" {}

variable "admin_username" {}
variable "ssh_public_key" {}

variable "vm_size" {
  default = "Standard_B2s"
}

variable "instance_count" {
  default = 2
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "backend_pool_ids" {
  type = list(string)
}