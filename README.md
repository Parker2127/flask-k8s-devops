# Flask-K8s-Devops 🚀

> A comprehensive, hands-on DevOps project focused on building, containerizing, and deploying a scalable Flask API to Azure Kubernetes Service.

![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-1.x-7B42BC?logo=terraform&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-AKS-0078D4?logo=microsoftazure&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestrated-326CE5?logo=kubernetes&logoColor=white)

---

## 📑 Table of Contents

- [Architecture](#-architecture-overview)
- [Tech Stack](#-tech-stack)
- [Getting Started](#-getting-started)
- [Monitoring](#-monitoring)
- [Learning Goals](#-learning-goals)
- [Troubleshooting](#-troubleshooting)

---

## 🏗 Architecture Overview

```mermaid
graph LR
    A[Flask API] --> B[Docker]
    B --> C[Azure Container Registry]
    C --> D[AKS Cluster]
    D --> E[Prometheus & Grafana]
```

---

## 🛠 Tech Stack

| Category   | Tool           | Purpose                           | Docs                                                                |
| ---------- | -------------- | --------------------------------- | ------------------------------------------------------------------- |
| Cloud      | Azure AKS      | Managed Kubernetes cluster        | [Docs](https://learn.microsoft.com/en-us/azure/aks/)                |
| Cloud      | Azure ACR      | Container image registry          | [Docs](https://learn.microsoft.com/en-us/azure/container-registry/) |
| IaC        | Terraform      | Infrastructure provisioning       | [Docs](https://developer.hashicorp.com/terraform/docs)              |
| IaC        | Azure CLI      | Resource management via CLI       | [Docs](https://learn.microsoft.com/en-us/cli/azure/)                |
| Containers | Docker         | Image build & containerization    | [Docs](https://docs.docker.com/)                                    |
| Containers | Python / Flask | Application runtime & framework   | [Docs](https://flask.palletsprojects.com/)                          |
| Monitoring | Prometheus     | Metrics collection & alerting     | [Docs](https://prometheus.io/docs/)                                 |
| Monitoring | Grafana        | Dashboards & visualization        | [Docs](https://grafana.com/docs/)                                   |
| Monitoring | Helm           | Kubernetes package manager        | [Docs](https://helm.sh/docs/)                                       |
| CI/CD      | GitHub Actions | Automated build & deploy pipeline | [Docs](https://docs.github.com/en/actions)                          |

---

## 🚀 Getting Started

### Prerequisites

- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) installed and configured
- [Terraform](https://developer.hashicorp.com/terraform/install) installed
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed
- An active Azure subscription

### Deployment Steps

**1. Clone the repository**

```bash
git clone https://github.com/your-username/flask-k8s-devops.git
cd flask-k8s-devops
```

**2. Log in to Azure**

```bash
az login
```

**3. Initialize Terraform**

```bash
cd terraform
terraform init
```

**4. Provision infrastructure**

```bash
terraform plan          # Preview changes
terraform apply -auto-approve
```

**5. Build & push Docker image**

```bash
# Build the Flask app image
docker build -t flask-app .

# Tag and push to ACR
az acr login --name <your-acr-name>
docker tag flask-app <your-acr-name>.azurecr.io/flask-app:latest
docker push <your-acr-name>.azurecr.io/flask-app:latest
```

**6. Deploy to AKS**

```bash
az aks get-credentials --resource-group <your-rg> --name <your-cluster>
kubectl apply -f k8s/
```

---

## 📊 Monitoring

Prometheus and Grafana are deployed via Helm for observability.

```bash
# Add the Helm repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Install the stack
helm install monitoring prometheus-community/kube-prometheus-stack
```

Access Grafana:

```bash
kubectl port-forward svc/monitoring-grafana 3000:80
# Open http://localhost:3000 (default credentials: admin / prom-operator)
```

---

## 📝 Learning Goals

- End-to-end automation with CI/CD pipelines
- Infrastructure as Code (IaC) with Terraform
- Container orchestration with Kubernetes on AKS
- Observability and monitoring for cloud-native apps

---

## 🔧 Troubleshooting

<details>
<summary><b>AKS node size / quota errors (e.g. standard_D2s_v3)</b></summary>

If you hit a quota error when provisioning:

1. Check your subscription quota in the Azure Portal under **Subscriptions → Usage + quotas**
2. Try an alternative VM size in `terraform/variables.tf`:

```hcl
variable "node_vm_size" {
  default = "Standard_B2s"  # Cheaper alternative
}
```

3. Or request a quota increase via the Azure Portal.

</details>

<details>
<summary><b>kubectl not connecting to cluster</b></summary>

```bash
az aks get-credentials --resource-group <your-rg> --name <your-cluster> --overwrite-existing
kubectl config current-context
```

</details>

---

_Built by Shrikar Kaduluri_
