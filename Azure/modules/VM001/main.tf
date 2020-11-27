locals {
  pip_name = var.pip_name

  nsg_name = "${var.vm_name}-nsg"

  nic_name = "${var.vm_name}nic"

  vm_name = var.vm_name
}

resource "azurerm_public_ip" "this" {
  name                = local.pip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_security_group" "this" {
  name                = local.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_interface" "this" {
  name                = local.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.internal_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this.id
  }
}

resource "azurerm_network_interface_security_group_association" "this" {
  network_interface_id      = azurerm_network_interface.this.id
  network_security_group_id = azurerm_network_security_group.this.id
}

resource "azurerm_virtual_machine" "main" {
  name                  = local.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.this.id]
  vm_size               = "Standard_F16s_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "7.8"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.vm_name}_OsDisk_1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    disk_size_gb      = 64
    managed_disk_type = "StandardSSD_LRS"
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_name
    admin_password = var.admin_pass
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

