variable "associations" {
  description = "Map of subnet to NSG association"
  type = map(object({
    subnet_id = string
    nsg_id    = string
  }))
}