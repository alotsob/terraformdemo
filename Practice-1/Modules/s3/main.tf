resource "aws_s3_bucket" "bob" {
  bucket = var.bucket_name
  acl    = var.s3_acl

  tags = {
    Name        = var.s3_bucket_tagname
    Environment = var.env_type
  }
}
