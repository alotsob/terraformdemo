terraform {
  backend "s3" {
      bucket = "terraform-statefile-robb"
      key = "robtech/practice/test"
      region = "us-east-1"
      dynamodb_table = "pract-test"
      profile = "default"
  }
}