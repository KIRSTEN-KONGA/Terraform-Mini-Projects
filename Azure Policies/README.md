## Requirements
<H1> Prior Knowledge of Azure Entra Policies </H1>

# In this mini project
1) Created a policy for allowed locations.
2) Created a policy for allowed VM Sizes.

# Refer to variables.tf file for list of allowed location and VM sizes. 

# Uncomment the code to test from main.tf (Test Cases)

# You can also try with Intiatives (which is a collection of policies)

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.12.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.35.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.35.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_policy_definition.location](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/resources/policy_definition) | resource |
| [azurerm_policy_definition.vm_size](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/resources/policy_definition) | resource |
| [azurerm_subscription_policy_assignment.example1](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/resources/subscription_policy_assignment) | resource |
| [azurerm_subscription_policy_assignment.example2](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/resources/subscription_policy_assignment) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | List of Allowed Locations | `list(string)` | <pre>[<br/>  "southindia",<br/>  "centralindia"<br/>]</pre> | no |
| <a name="input_vm_sizes"></a> [vm\_sizes](#input\_vm\_sizes) | List of allowed VM sizes | `list(string)` | <pre>[<br/>  "Standard_B1s",<br/>  "Standard_B2s"<br/>]</pre> | no |

## Outputs

No outputs.

# Document generated using terraform-docs markdown table.. Enjoy... :-)