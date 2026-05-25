# Flask-K8s-Devops

A comprehensive, hands-on DevOps project focused on building, containerizing, and deploying a scalable Flask API to Azure. This project demonstrates end-to-end automation, Infrastructure as Code, and production-ready observability.

## 🚀 The Architecture
This project follows a modern cloud-native workflow:
- **Application**: A Python Flask API containerized with Docker.
- **Infrastructure**: Provisioned on Azure (AKS) using Terraform for IaC.
- **CI/CD**: Automated pipelines via GitHub Actions (Build → Push to ACR → Deploy to AKS).
- **Monitoring**: Real-time observability using Prometheus and Grafana.

## 🛠 Tech Stack
* **Cloud**: Microsoft Azure (AKS, ACR)
* **Infrastructure**: Terraform, Azure CLI
* **Containerization**: Docker, Python (Flask, Gunicorn)
* **Orchestration**: Kubernetes
* **CI/CD**: GitHub Actions
* **Monitoring**: Prometheus, Grafana, Helm

## 📝 Learning Journey
This project was developed following a modular learning path:
1. **Containerization**: Dockerizing the application for portable, consistent environments.
2. **Infrastructure as Code**: Managing cloud resources with Terraform.
3. **Orchestration**: Deploying and scaling containers on Kubernetes.
4. **Automation**: Implementing seamless CI/CD pipelines.
5. **Observability**: Monitoring cluster health and application metrics.

---
*Built as a learning project by Shrikar Kaduluri.*