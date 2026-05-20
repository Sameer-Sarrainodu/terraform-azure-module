variable "name" {}
variable "location" {}
variable "resource_group_name" {}

variable "subnet_id" {}

variable "is_public" {
  type = bool
}

variable "private_ip" {
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}