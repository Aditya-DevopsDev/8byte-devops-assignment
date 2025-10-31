# Approach & Implementation Details

## 1️⃣ Objective
Automate the full DevOps workflow — build, deploy, test, and destroy — using **Terraform**, **Docker**, **Flask**, and **GitHub Actions**, all without touching real AWS resources (via LocalStack).

---

## 2️⃣ Architecture Overview
- **Terraform** provisions an **S3 bucket** in LocalStack.
- **Flask** app runs in **Docker** and connects to that S3 bucket.
- **GitHub Actions** orchestrates everything:
  - Starts LocalStack (mock AWS)
  - Initializes Terraform
  - Builds & runs Docker image
  - Tests the endpoint
  - Cleans up with `terraform destroy`

---

## 3️⃣ CI/CD Workflow Summary
1. Code push triggers GitHub Actions.
2. LocalStack container starts (mock AWS services).
3. Terraform creates infrastructure.
4. Flask app builds and runs inside Docker.
5. The CI tests if the Flask app can connect to the mock S3.
6. After success, all containers and resources are destroyed.

---

## 4️⃣ Security & Optimization
- Uses **non-root user** in Dockerfile.
- Multi-stage Docker build minimizes final image size.
- No real AWS credentials required — everything runs locally.
- Clean-up ensures zero leftover resources after workflow.

---

## 5️⃣ Result
✅ Fully automated, end-to-end pipeline:
- Infrastructure provisioning → Application deployment → Testing → Teardown.
- Works 100% in CI/CD with LocalStack (no AWS cost).
