variable "vnet_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "vnet_cidr" {
  type = string
}

variable "subnets" {
  description = "Map of subnet_name -> cidr"
  type = map(object({
    cidr = string
  }))
}

variable "tags" {
  type    = map(string)
  default = {}
}