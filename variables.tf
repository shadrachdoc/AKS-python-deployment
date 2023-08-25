variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "resource_group" {
  description = "Name of the resource group"
  type        = string
}

variable "AZURE_CLIENT_ID" {
  description = "Azure client ID"
  type        = string
}

variable "AZURE_CLIENT_SECRET" {
  description = "Azure client secret"
  type        = string
}
