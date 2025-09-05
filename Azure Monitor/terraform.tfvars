resource_group_name    = "AzureMonitorResourceGroup"
rg_location            = "southindia"
vnet_name              = "AzureMonitorVNet"
vnet_address_space     = ["10.0.0.0/16"]
subnet_name            = "AzureMonitorSubnet"
subnet_address_space   = ["10.0.1.0/24"]
linuxvm_public_ip_name = "MonitorVmPublicIP"
nic_name               = "MonitorVmNIC"
nsg_name               = "MonitorVmNSG"
nsg_rules = [{
  name                       = "AllowSSH"
  priority                   = 110
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "*"
  source_port_range          = "*"
  destination_port_range     = "22"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}]

admin_username = "azureadmin"
admin_password = "MySecureP@ssw0rd!" # you can adopt safer password mechanism :-) ..!!