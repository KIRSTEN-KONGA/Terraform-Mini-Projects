## Requirements

<H1> Prior Knowledge of Azure VM and Monitor Alerts </H1>

# In this Mini-Project we are creating a Linux VM and trigger an Alert based on condition in Azure  using Terraform DRY code cocept
# You can also modularize the code for better Administration/Governance (Not done here) 
# Install Stress Post Creation for stress test Code/Scrpit in > (scrpits.sh) file.

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.35.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.35.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_monitor_action_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/resources/monitor_action_group) | resource |
| [azurerm_monitor_metric_alert.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/resources/monitor_metric_alert) | resource |
| [azurerm_network_interface.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The password for the admin user. | `string` | `""` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The username for the admin user. | `string` | `""` | no |
| <a name="input_linuxvm_public_ip_name"></a> [linuxvm\_public\_ip\_name](#input\_linuxvm\_public\_ip\_name) | The name of the public IP address for the Linux VM. | `string` | `""` | no |
| <a name="input_nic_name"></a> [nic\_name](#input\_nic\_name) | The name of the network interface for the Linux VM. | `string` | `""` | no |
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | The name of the network security group for the Linux VM. | `string` | `""` | no |
| <a name="input_nsg_rules"></a> [nsg\_rules](#input\_nsg\_rules) | The security rules for the network security group. | <pre>list(object({<br/>    name                       = string<br/>    priority                   = number<br/>    direction                  = string<br/>    access                     = string<br/>    protocol                   = string<br/>    source_port_range          = string<br/>    destination_port_range     = string<br/>    source_address_prefix      = string<br/>    destination_address_prefix = string<br/>  }))</pre> | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group where the Azure Monitor resources will be created. | `string` | `""` | no |
| <a name="input_rg_location"></a> [rg\_location](#input\_rg\_location) | The location where the resource group will be created. | `string` | `""` | no |
| <a name="input_subnet_address_space"></a> [subnet\_address\_space](#input\_subnet\_address\_space) | The address prefix for the subnet. | `list(string)` | <pre>[<br/>  ""<br/>]</pre> | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The name of the subnet within the virtual network. | `string` | `""` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The address space for the virtual network. | `list(string)` | <pre>[<br/>  ""<br/>]</pre> | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the virtual network. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pub-ip"></a> [pub-ip](#output\_pub-ip) | n/a |


# Document Generated using terraform-docs command ...... Enjoy.... :-) 