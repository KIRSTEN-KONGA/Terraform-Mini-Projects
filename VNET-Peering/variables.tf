variable "rg_name" {
  description = "Name of the resource group"
  type        = string
  default     = "PeeringRG"


}
variable "rg_location" {
  description = "Location for the resource group"
  type        = string
  default     = "southindia"


}

variable "vnet_config" {
  description = "Configuration for VNets and Subnets"
  type = map(object({
    name            = string
    address_space   = list(string)
    subnet_name     = string
    subnet_prefixes = list(string)
  }))
  default = {
    "Vnet1" = {
      name            = "VNET1"
      address_space   = ["10.0.0.0/16"]
      subnet_name     = "subnet1"
      subnet_prefixes = ["10.0.1.0/24"]
    },
    "Vnet2" = {
      name            = "VNET2"
      address_space   = ["192.168.0.0/16"]
      subnet_name     = "subnet2"
      subnet_prefixes = ["192.168.1.0/24"]
    }
  }
}
