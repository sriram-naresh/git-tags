# This file configures the backend for storing Terraform state files.
# It uses an S3 bucket as the backend, which is a common practice for remote state management.

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-t"
    key            = "ec2/all-state/terraform.tfstate"
    region        =  "us-east-1"
    #dynamodb_table = "value-lock-table"
    #encrypt        = true
  }
}