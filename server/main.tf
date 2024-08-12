terraform {
  backend "s3" {
    bucket = "nsse1-terraform-state-bucket"
    key    = "server/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "nsse-terraform-state-lock-table"
  }
}