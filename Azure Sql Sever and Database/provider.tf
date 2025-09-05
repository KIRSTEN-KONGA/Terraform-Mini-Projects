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
  subscription_id = "eeec81a9-1c86-498f-804d-5b9cc07f1fc2"
}