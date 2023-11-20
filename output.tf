output "aks_cluster_ip" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.cluster_ipv4_cidr
}

