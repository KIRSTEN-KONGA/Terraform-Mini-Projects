variable "resource_group_name" {
  description = "The name of the resource group where the Azure Monitor resources will be created."
  type        = string
  default     = ""
}
variable "rg_location" {
  description = "The location where the resource group will be created."
  type        = string
  default     = ""
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
  default     = ""
}

variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
  default     = [""]
}

variable "subnet_name" {
  description = "The name of the subnet within the virtual network."
  type        = string
  default     = ""
}

variable "subnet_address_space" {
  description = "The address prefix for the subnet."
  type        = list(string)
  default     = [""]
}

variable "linuxvm_public_ip_name" {
  description = "The name of the public IP address for the Linux VM."
  type        = string
  default     = ""
}

variable "nic_name" {
  description = "The name of the network interface for the Linux VM."
  type        = string
  default     = ""
}

variable "nsg_name" {
  description = "The name of the network security group for the Linux VM."
  type        = string
  default     = ""
}

variable "nsg_rules" {
  description = "The security rules for the network security group."
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = []

}


variable "admin_username" {
  description = "The username for the admin user."
  type        = string
  default     = ""
}

variable "admin_password" {
  description = "The password for the admin user."
  type        = string
  sensitive   = true
  default     = ""
}