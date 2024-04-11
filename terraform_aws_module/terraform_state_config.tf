# Store the Terraform State File in S3 backet
terraform {
  backend "s3" {
    bucket         = var.backet_name
    key            = var.backet_key
    region         = var.region
  }
}