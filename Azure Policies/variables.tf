variable "vm_sizes" {
  description = "List of allowed VM sizes"
  type = list(string)
  default = [ "Standard_B1s", "Standard_B2s" ]
}

variable "location" {
    description = "List of Allowed Locations"
    type = list(string)
    default = [ "southindia", "centralindia" ]
  }