#Print useful values after Terraform runs, such as the public IP address of the VM and the Kubernetes cluster credentials.
output "acr_login_server" {
  description = "The login server URL of the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.main.name
}

#outputs are printed at the end of terraform apply, you can easily see values you need for next steps, such as connecting to the cluster or pushing images to ACR, without having to look them up in the Azure portal.