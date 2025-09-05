# Data Block to get the subscription details

data "azurerm_subscription" "current"{}

# Policy definition for allowed VM sizes

resource "azurerm_policy_definition" "vm_size" {
  name         = "vm-size"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Allowed vm policy"

  policy_rule = jsonencode({
    if = {
        field = "Microsoft.Compute/virtualMachines/sku.name",
        notIn = var.vm_sizes
      },       
    then = {
      effect = "deny"
  }
  
})
}

# Policy Assignment for allowed VM-sizes

resource "azurerm_subscription_policy_assignment" "example1" {
  name                 = "size-assignment"
  policy_definition_id = azurerm_policy_definition.vm_size.id
  subscription_id      = data.azurerm_subscription.current.id
}

# Policy definition for allowed locations

resource "azurerm_policy_definition" "location" {
  name         = "location"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Allowed location policy"

  policy_rule = jsonencode({
    if = {
        field = "location",
        notIn = var.location
      },       
    then = {
      effect = "deny"
  }
  
})

}

# Policy assignment for allowed locations

resource "azurerm_subscription_policy_assignment" "example2" {
  name                 = "location-assignment"
  policy_definition_id = azurerm_policy_definition.location.id
  subscription_id   = data.azurerm_subscription.current.id
}

# Testing (Uncomment the given code below) ( Remove "/* */" symbol)
# Run command (terraform apply -target azurerm_resource_group.this -auto-approve) to examine the policies above.

/* resource "azurerm_resource_group" "this" {
  name = "Policy-TESTRG"
  location = "eastus"
} */