terraform {
  backend "azurerm" {
    resource_group_name  = "test_env"
    storage_account_name = "statefile2245"
    container_name       = "statefiles"
    key                  = "terraform.tfstate"
  }
}
