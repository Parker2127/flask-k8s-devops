#USING VARIBLES TOO AVOID HARDCODING VALUES IN THE CODE
variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "flask-app-rg"
}

variable "location" {
  description = "Azure region for resource deployment"
  type        = string
  default     = "eastus"
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
  default     = "flask-app-aks"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry -must be globally unique"
  type        = string
  default     = "flaskappacrshree"
}