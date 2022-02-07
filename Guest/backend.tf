terraform {
  backend "s3" {
    bucket = "guest-management-system"
    key    = "blist/demoday/guest.tfstate"
    region = "us-east-1"
    profile = "default"
    dynamodb_table = "Guest-state-test"
  }
}
