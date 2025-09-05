# Resource Group 
resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.rg_location
}

# Vnet 
resource "azurerm_virtual_network" "this" {
  resource_group_name = azurerm_resource_group.this.name
  name                = var.vnet_name
  location            = azurerm_resource_group.this.location
  address_space       = var.vnet_address_space
}

# Subnet
resource "azurerm_subnet" "this" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = var.subnet_address_space
}

# Public Ip Addr
resource "azurerm_public_ip" "this" {
  name                = var.linuxvm_public_ip_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  allocation_method   = "Static"
  sku                 = "Basic"
}

# Network Interface (NIC)
resource "azurerm_network_interface" "this" {
  name                = var.nic_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.this.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this.id
  }
}

# Network Security Group ( NSG )
resource "azurerm_network_security_group" "this" {
  name                = var.nsg_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  # Dynamic block to add more rules if needed
  dynamic "security_rule" {
    for_each = var.nsg_rules
    content {


      name                       = "${security_rule.value.name}-Rule"
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
    }
  }

}

# Virtual Machine ( VM )
resource "azurerm_linux_virtual_machine" "this" {
  name                            = local.vm_name #Using locals here if you want to change the VM name do it easily using locals
  resource_group_name             = azurerm_resource_group.this.name
  location                        = azurerm_resource_group.this.location
  size                            = local.vm_size #Using local here if you want to change the VM size do it easily using locals
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.this.id,
  ]

# Using Provisioner to execute scrpit You can also use "custom_data" argument which is commented below. 
  provisioner "remote-exec" {
    script = "./script.sh" # "${path.module}/script.sh"
  }
  connection {
    type     = "ssh"
    host     = azurerm_public_ip.this.ip_address
    user     = var.admin_username
    password = var.admin_password
  }

  # # Provisioning the VM with a simple script to install Stress tool for CPU stress testing
  # custom_data = filebase64("${path.module}/script.sh")

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

# NSG with NIC association (you can also associate NSG with Subnet as an option or as a COGO)
resource "azurerm_network_interface_security_group_association" "this" {
  network_interface_id      = azurerm_network_interface.this.id
  network_security_group_id = azurerm_network_security_group.this.id
}



