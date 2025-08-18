# --------------------
# Virtual Machines in VNets
# --------------------

resource "azurerm_network_interface" "this" {
  for_each = var.vnet_config

  name                = "${each.value.name}-nic"
  location            = var.rg_location
  resource_group_name = azurerm_resource_group.this.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.this[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  for_each = var.vnet_config

  name                            = "${each.value.name}-vm"
  location                        = var.rg_location
  resource_group_name             = azurerm_resource_group.this.name
  size                            = "Standard_B1s"
  admin_username                  = "azureuser"
  admin_password                  = "P@ssw0rd123"   # Note: Use a secure password or SSH key in production
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.this[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}

# Create a Network Security Group and associate it with the subnets, I have created a simple rule to allow SSH access
# You can try it with a jumpbox VM in any vnet and then access the other VMs via SSH. I have not used a jumpbox VM here for simplicity.
# Used Bastion Host for secure access to VMs in the VNets, but commented out the Bastion Host resources.
# Uncomment the Bastion Host resources if you want to use it.


# --------------------
# Network Security Group and Rules
# --------------------

resource "azurerm_network_security_group" "this" {
  name                = "${var.rg_name}-nsg"
  location            = var.rg_location
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_network_security_rule" "this" {
  name                        = "Allow-SSH"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.this.name
  network_security_group_name = azurerm_network_security_group.this.name
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = var.vnet_config

  subnet_id                 = azurerm_subnet.this[each.key].id
  network_security_group_id = azurerm_network_security_group.this.id
}


/* 
# --------------------
# Azure Bastion Subnet (only in VNET1)
# --------------------
resource "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this["Vnet1"].name
  address_prefixes     = ["10.0.255.0/27"] # Must be at least /27
}

# --------------------
# Bastion Public IP
# --------------------
resource "azurerm_public_ip" "bastion" {
  name                = "bastion-pip"
  resource_group_name = azurerm_resource_group.this.name
  location            = var.rg_location
  allocation_method   = "Static"
  sku                 = "Standard"
}

# --------------------
# Bastion Host
# --------------------
resource "azurerm_bastion_host" "this" {
  name                = "bastion-host"
  location            = var.rg_location
  resource_group_name = azurerm_resource_group.this.name

  ip_configuration {
    name                 = "bastion-ip-config"
    subnet_id            = azurerm_subnet.bastion.id
    public_ip_address_id = azurerm_public_ip.bastion.id
  }
} */