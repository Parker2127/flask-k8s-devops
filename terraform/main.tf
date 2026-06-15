#THE ACTUAL INFRASTUCTURE CODE TO CREATE THE RESOURCES IN AZURE

#Installation
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
      #3.0 means any version, avoids major version updates that may cause breaking changes, but allows minor and patch updates
    }
  }
}

#Confiiguration
provider "azurerm" {
  features {}
}

#Resource group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

#Azure Container Registry
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Basic"
  admin_enabled       = true
}

#Azure Kubernetes Service
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = "eastus2"
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "flaskappaks" #used in cluster endpoint URL, must be globally unique

  # REQUIRED: Add this line to match the cluster's existing state
  oidc_issuer_enabled = true

  default_node_pool {
    name       = "default"
    node_count = 2                 # one for local project, usually 3+ for production
    vm_size    = "Standard_D2s_v3" # cost effective for development, for production use larger sizes like Standard_DS3_v2 or Standard_E4s_v3
  }

  identity {
    type = "SystemAssigned" #AKS will create a managed identity for the cluster, used to pull images from ACR and manage resources, more secure than using service principals with secrets
  }
}

#Giving permissions to AKS to pull images from ACR, using the managed identity of the AKS cluster, more secure than using service principals with secrets
resource "azurerm_role_assignment" "acr_pull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"                                               #built in role that allows pulling images from ACR
  principal_id                     = azurerm_kubernetes_cluster.aks.identity[0].principal_id #assigning the role to the AKS cluster's managed identity
  skip_service_principal_aad_check = true                                                    #skips the check for service principal in Azure AD, necessary when using system assigned identities in some cases, but use with caution as it can bypass security checks
}
