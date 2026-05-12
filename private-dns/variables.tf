variable "zone_name" {}
variable "resource_group_name" {}
variable "vnet_id" {}

variable "records" {
  type = map(string)
}