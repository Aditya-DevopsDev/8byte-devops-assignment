# 8byte DevOps Assignment

## 🚀 Overview
This project automates everything — Docker, Terraform, and LocalStack — using GitHub Actions.
It creates infrastructure, builds the app, tests it, and cleans up automatically.

## 🧩 Stack
- **Flask** → Web application
- **Terraform** → Infrastructure as Code
- **LocalStack** → Mock AWS for testing
- **Docker** → Containerization
- **GitHub Actions** → CI/CD automation

## ⚙️ How It Works
1. LocalStack starts (mock AWS)
2. Terraform creates an S3 bucket
3. Flask app builds in Docker and connects to that bucket
4. GitHub Actions runs everything end-to-end automatically

## 🧹 Cleanup
```bash
terraform destroy -auto-approve
docker rm -f flask-app localstack
```
