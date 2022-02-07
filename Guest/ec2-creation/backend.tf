terraform {
  backend "s3" {
    bucket = "terraform-statefile-robb"
    key    = "creation.tfstate"
    region = "us-east-1"
    profile = "default"
  }
}
