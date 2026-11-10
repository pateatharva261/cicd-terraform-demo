# CI/CD with Jenkins and Terraform

A small Flask app with a Jenkins CI/CD pipeline and Terraform (IaC) configuration for AWS EC2.

## Structure
- `app.py`, `test_app.py`: Flask app and pytest unit tests
- `Jenkinsfile`: pipeline (Checkout, Build, Test, Package, Deploy, Terraform Validate and Plan)
- `terraform/`: AWS EC2 instance and security group defined as code

## Pipeline stages
1. Checkout source from GitHub
2. Build (virtualenv and dependencies)
3. Test (pytest, JUnit report)
4. Package (archive the artifact)
5. Deploy (copy to the deploy folder)
6. Terraform Init, Validate and Plan (no real AWS account needed)

## Run Terraform locally
cd terraform
terraform init
terraform validate
terraform plan