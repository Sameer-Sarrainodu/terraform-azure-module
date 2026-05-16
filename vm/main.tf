resource "azurerm_network_interface" "nic" {
  for_each = var.vm_map

  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vm_map

  name                = each.key
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = each.value.size
  admin_username      = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

source_image_reference {
  publisher = "RedHat"
  offer     = "RHEL"
  sku       = "9-lvm-gen2"
  version   = "latest"
}
  disable_password_authentication = true

  tags = var.tags
}