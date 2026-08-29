resource "aws_s3_bucket" "demo" {
  bucket = var.bucket_name

  tags = merge(
    var.common_tags,
    {
      Name = "Terraform Demo"
    }
  )
}

resource "aws_s3_bucket_versioning" "demo" {
  bucket = aws_s3_bucket.demo.id

  versioning_configuration {
    status = "Enabled"
  }
}
