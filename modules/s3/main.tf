resource "random_string" "bucket_suffix" {
  length  = 7
  special = false
  upper   = false
}

resource "aws_s3_bucket" "resource_bucket" {
  bucket        = "${var.bucket_prefix}-${random_string.bucket_suffix}"
  force_destroy = true

  tags = {
    Name        = "${var.bucket_prefix}-${random_string.bucket_suffix}"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.resource_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


