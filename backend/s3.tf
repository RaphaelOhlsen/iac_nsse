resource "aws_s3_bucket" "backend" {
  bucket = var.s3_bucket
  tags = var.tags

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "aws_s3_bucket_versioning" "backend" {
  bucket = aws_s3_bucket.backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend" {
  bucket = aws_s3_bucket.backend.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}