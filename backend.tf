terraform {
  backend "s3" {
    bucket       = "admin-terraform-state-2026-830"
    key          = "prod/networking/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
