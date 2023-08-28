terraform {
  backend "azurerm" {
    resource_group_name   = "test_env"
    storage_account_name = "tfstatestorageacct34"
    container_name       = "tfstatefiles"
    key                  = "prod/terraform/tfstate"
    client_id             = "8826a619-e971-421c-8230-cac671d17289"
    client_secret         = "vqa8Q~uHiv8lpHtM3RCDXjACaeRHv7aml_7Z8btV"
    tenant_id             = "5a8844e2-dc20-4f80-b99e-77196d375a40"
  }
}

provider "azurerm" {
  features {}
}


data "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = "East US"
  resource_group_name = data.azurerm_resource_group.aks_rg.name
  dns_prefix          = "aks-cluster-dns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  service_principal {
    client_id     = var.AZURE_CLIENT_ID
    client_secret = var.AZURE_CLIENT_SECRET
  }

  tags = {
    Environment = "Test"
  }
}

