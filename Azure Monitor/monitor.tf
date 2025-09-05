# Montior Action Group for the VM 

resource "azurerm_monitor_action_group" "this" {
  name                = "MonitorActionGroup"
  resource_group_name = azurerm_resource_group.this.name
  short_name          = "MonitorAG"

  email_receiver {
    name          = "Admin"
    email_address = "kirstenpeter56.kp@gmail.com"
  }
}

# Monitor Alert and its Metric's 
resource "azurerm_monitor_metric_alert" "this" {
  name                = "HighCPUAlert"
  resource_group_name = azurerm_resource_group.this.name
  scopes              = [azurerm_linux_virtual_machine.this.id]
  description         = "Alert when CPU usage is high"
  severity            = 3
  auto_mitigate       = false

  criteria {
    metric_name      = "Percentage CPU"
    metric_namespace = "Microsoft.Compute/virtualMachines"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 60
  }

  action {
    action_group_id = azurerm_monitor_action_group.this.id
  }

}