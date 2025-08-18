resource "azurerm_resource_group" "this" {
  location = var.rg_location
  name     = var.rg_name
}

resource "azurerm_virtual_network" "this" {
  for_each            = var.vnet_config
  resource_group_name = azurerm_resource_group.this.name
  location            = var.rg_location
  name                = each.value.name
  address_space       = each.value.address_space
}

resource "azurerm_subnet" "this" {
  for_each             = var.vnet_config
  name                 = each.value.subnet_name
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this[each.key].name
  address_prefixes     = each.value.subnet_prefixes
}

resource "azurerm_virtual_network_peering" "this" {
  for_each = local.Vnet_Peering

  resource_group_name = azurerm_resource_group.this.name
  name                = each.key

  virtual_network_name      = azurerm_virtual_network.this[each.value.source].name
  remote_virtual_network_id = azurerm_virtual_network.this[each.value.target].id

}