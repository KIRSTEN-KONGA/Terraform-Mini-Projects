## Requirements

<p align="center">
  <img src="./Vnet-peering.png" alt="Alt text" width="600"/>
</p>

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.35.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.35.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rg_location"></a> [rg\_location](#input\_rg\_location) | Location for the resource group | `string` | `"southindia"` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Name of the resource group | `string` | `"PeeringRG"` | no |
| <a name="input_vnet_config"></a> [vnet\_config](#input\_vnet\_config) | Configuration for VNets and Subnets | <pre>map(object({<br/>    name            = string<br/>    address_space   = list(string)<br/>    subnet_name     = string<br/>    subnet_prefixes = list(string)<br/>  }))</pre> | <pre>{<br/>  "Vnet1": {<br/>    "address_space": [<br/>      "10.0.0.0/16"<br/>    ],<br/>    "name": "VNET1",<br/>    "subnet_name": "subnet1",<br/>    "subnet_prefixes": [<br/>      "10.0.1.0/24"<br/>    ]<br/>  },<br/>  "Vnet2": {<br/>    "address_space": [<br/>      "192.168.0.0/16"<br/>    ],<br/>    "name": "VNET2",<br/>    "subnet_name": "subnet2",<br/>    "subnet_prefixes": [<br/>      "192.168.1.0/24"<br/>    ]<br/>  }<br/>}</pre> | no |

## Outputs

No outputs.


