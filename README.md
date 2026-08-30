terraform/
├── README.md          ← paste the README here
├── main.tf
├── backend.tf
├── .gitignore
├── .terraform.lock.hcl
│
└── modules/
    ├── vpc/
    ├── ec2/
    └── s3/
## 🔄 Deployment Workflow

The infrastructure was deployed and validated using the following Terraform workflow:

```text
terraform init
       ↓
terraform validate
       ↓
terraform plan
       ↓
terraform apply
       ↓
terraform output
       ↓
terraform state list
**Project Architecture** section near the top:

```markdown
## 🏗️ Project Architecture

This project uses a modular Terraform architecture:

```text
                    Terraform
                        │
                        ▼
                 AWS Provider
                        │
          ┌─────────────┼─────────────┐
          │             │             │
          ▼             ▼             ▼
      VPC Module    EC2 Module    S3 Module
          │             │             │
          │             │             │
     ┌────┴────┐    ┌───┴────┐       │
     │         │    │        │       │
     ▼         ▼    ▼        ▼       ▼
    VPC     Public EC2    Security  S3 Bucket
            Subnet       Group      Versioning
              │
              ▼
        Internet Gateway

 **Project Structure**:

```markdown
## 📁 Project Structure

```text
terraform/
├── README.md
├── main.tf
├── backend.tf
├── .gitignore
├── .terraform.lock.hcl
│
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── ec2/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    └── s3/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
