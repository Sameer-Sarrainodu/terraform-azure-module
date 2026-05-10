variable "name" {}
variable "location" {}
variable "resource_group_name" {}

variable "subnet_ids" {
  description = "Map of subnet_ids"
  type        = map(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}