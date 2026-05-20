resource "azurerm_linux_virtual_machine_scale_set" "vmss" {

  for_each = var.vmss_map

  name                = each.key
  resource_group_name = var.resource_group_name
  location            = var.location

  sku       = each.value.vm_size
  instances = each.value.instances

  admin_username = var.admin_username

  computer_name_prefix = each.key

  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "9-lvm-gen2"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  network_interface {

    name    = "${each.key}-nic"
    primary = true

    ip_configuration {

      name      = "internal"
      primary   = true
      subnet_id = each.value.subnet_id
      application_gateway_backend_address_pool_ids = var.backend_pool_map[each.key]
    }
  }

  upgrade_mode = "Rolling"

  tags = var.tags
}