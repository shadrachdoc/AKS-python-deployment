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

