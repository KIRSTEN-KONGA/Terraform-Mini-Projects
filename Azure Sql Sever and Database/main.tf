resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.resource_group_location

}

resource "azurerm_mssql_server" "this" {
  name                         = "mysqlserverdemo9986"
  resource_group_name          = azurerm_resource_group.this.name
  location                     = azurerm_resource_group.this.location
  version                      = "12.0"
  administrator_login          = "myadmin"
  administrator_login_password = "StrongP@ssw0rd1234" #Not recommended to hardcode passwords in production + store passwords securely

}

resource "azurerm_mssql_database" "this" {
  name        = "mydatabase9986"
  sku_name    = "S0"
  server_id   = azurerm_mssql_server.this.id
  max_size_gb = "1.0"
  sample_name = "AdventureWorksLT"
}

resource "azurerm_mssql_firewall_rule" "this" {
  name             = "MyFirewallRule9986"
  server_id        = azurerm_mssql_server.this.id
  start_ip_address = local.ip_addr # Replace with your actual IP address
  end_ip_address   = local.ip_addr # Replace with your actual IP address
}

output "fqdn" {
  value = azurerm_mssql_server.this.fully_qualified_domain_name
}