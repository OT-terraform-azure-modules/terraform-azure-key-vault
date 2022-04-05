provider "azurerm" {
  features {}

}
terraform {
  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.99.0"
    }
  }
}



module "Key_vault" {
  source              = "../"
  name                = "my-keyvault-0079900"
  resource_group_name = "Automation-RG"
  

}