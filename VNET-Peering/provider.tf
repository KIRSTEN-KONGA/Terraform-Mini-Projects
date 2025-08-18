terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.35.0"
    }
  }
  required_version = ">= 1.9.0"
}

provider "azurerm" {
  features {}
  subscription_id = "" # Specify your Azure subscription ID here or use environment variables
}