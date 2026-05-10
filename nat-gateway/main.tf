resource "azurerm_public_ip" "nat_pip" {
  name                = "${var.name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}

resource "azurerm_nat_gateway" "nat" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = "Standard"

  tags = var.tags
}

resource "azurerm_nat_gateway_public_ip_association" "assoc" {
  nat_gateway_id       = azurerm_nat_gateway.nat.id
  public_ip_address_id = azurerm_public_ip.nat_pip.id
}

resource "azurerm_subnet_nat_gateway_association" "subnet_assoc" {
  for_each = var.subnet_ids

  subnet_id      = each.value
  nat_gateway_id = azurerm_nat_gateway.nat.id
}