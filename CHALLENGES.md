# Challenges Faced & Solutions

## ⚙️ 1. LocalStack Container Not Starting
**Issue:** Container kept failing health checks in GitHub Actions.  
**Fix:** Used `LS_LOG=trace` and health retries to improve startup stability.

---

## 🧱 2. Docker App Crashing
**Issue:** `ModuleNotFoundError: No module named boto3`.  
**Fix:** Installed dependencies inside `/app/deps` and used `PYTHONPATH` for runtime.

---

## 🧩 3. Terraform S3 Connection Refused
**Issue:** Terraform couldn’t reach LocalStack endpoint.  
**Fix:** Updated provider endpoint and ensured LocalStack health check before Terraform runs.

---

## 🧰 4. Large File Push Rejected by GitHub
**Issue:** Terraform provider binaries exceeded 100 MB.  
**Fix:** Added `.gitignore` and removed `.terraform/` and state files before commit.

---

## ✅ Final Outcome
A stable, end-to-end **DevOps automation pipeline** that builds, deploys, tests, and cleans itself — entirely locally.
