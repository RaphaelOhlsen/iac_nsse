variable "region" {
  default = "us-east-1"
}

variable "s3_bucket" {
  type = string
  default = "nsse1-terraform-state-bucket"
}

variable "dynamo_table" {
  type = object({
    name = string
    billing_mode = string
    hash_key = string 
  })

  default = {
    name = "nsse-terraform-state-lock-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
  }
}

variable "tags" {
  type = object({
    Project     = string,
    Environment = string
  })
  default = {
    Project     = "nsse"
    Environment = "production"
  }
}