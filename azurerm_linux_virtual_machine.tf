
resource "azurerm_network_interface" "default" {
  name                = "${var.vm_name}-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  enable_accelerated_networking = true

  internal_dns_name_label = var.vm_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "default" {
  name                = var.vm_name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  size                = var.vm_size
  admin_username      = var.admin_username
  computer_name       = var.vm_name

  custom_data = base64encode(
    templatefile(
      "${path.module}/scripts/cloud-init.tpl",
      {
        tailscale_auth_key = var.tailscale_auth_key
      }
    )
  )

  network_interface_ids = [
    azurerm_network_interface.default.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}