variable "name" {}
variable "location" {}
variable "resource_group_name" {}

variable "subnet_id" {
  description = "AzureBastionSubnet ID"
}

variable "tags" {
  type    = map(string)
  default = {}
}