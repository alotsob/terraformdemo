locals {
  common_tags = {
    Name ="jjtech" 
    App_Name = "ovid" 
    Cost_center = "xyz222"
    Business_unit = "GBS"
    Project = " GBS"
    App_Role = "Webserver"
    Customer = "students"
    Environment = " Dev"
    Confidentiality = "Restricted"
    opt_in-opt_out = "yes"
    Application_ID = "246372"
    Compliance = "pic"
  }
}
resource "aws_instance" "Webserver" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name ="jjtech" 
    App_Name = "ovid" 
    Cost_center = "xyz222"
    Business_unit = "GBS"
    Project = " GBS"
    App_Role = "Webserver"
    Customer = "students"
    Environment = " Dev"
    Confidentiality = "Restricted"
    opt_in-opt_out = "yes"
    Application_ID = "246372"
    Compliance = "pic"
  }
}
resource "aws_instance" "Webserver1" {
  ami           = var.ami_id[linux]
  instance_type = var.instance_type[0]
  tags = local.common_tags
}

resource "aws_instance" "Webserver2" {
  ami           = var.ami_id[rhel]
  instance_type = var.instance_type[1]
  tags = local.common_tags
}
resource "aws_instance" "Webserver2" {
  ami           = var.ami_id[windows]
  instance_type = var.instance_type[2]
  tags = local.common_tags
}

resource "aws_ebs_volume" "EBS1" {
  availability_zone = "us-east-1a"
  size              = 40

  tags = local.common_tags
}