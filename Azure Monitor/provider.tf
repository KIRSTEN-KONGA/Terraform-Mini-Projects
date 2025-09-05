terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.35.0"
    }
  }
}
provider "azurerm" {
  features {}
  #  subscription_id = "Enter your Azure subscription ID here or set it in the environment variable "export ARM_SUBSCRIPTION_ID". 
}