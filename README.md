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
