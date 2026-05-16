variable "name" {}

variable "resource_group_name" {}

variable "location" {}

variable "subnet_id" {}

variable "admin_username" {}

variable "ssh_public_key" {}

variable "custom_data" {
  description = "Custom cloud-init/bootstrap script"
  type        = string
  default     = null
}

variable "vm_size" {
  default = "Standard_D2s_v3"
}

variable "tags" {
  type    = map(string)
  default = {}
}
