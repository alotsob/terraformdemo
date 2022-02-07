variable "cidr_block" {
  default = ["10.1.0.0/16","10.2.0.0/16"]
}

resource "aws_vpc" "demovpc" {
  for_each = toset(var.cidr_block)
  cidr_block = each.value
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"
  tags = {
      Name = "delete"
  }
}
# OR
/*
variable "cidr_block" {
  default = ["10.1.0.0/16","10.2.0.0/16"]
}
resource "aws_vpc" "demovpc" {
  for_each = toset(var.cidr_block)
  cidr_block = each.value
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"
  tags = {
      Name = "VPC ${each.value}"
  }
}
*/

/*
variable "cidr_block" {
  default = ["10.1.0.0/16","10.2.0.0/16"]
}
resource "aws_vpc" "demovpc" {
  for_each = toset(var.cidr_block)
  cidr_block = each.key
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"
  tags = {
      Name = "VPC ${each.key}"
  }
}
*/