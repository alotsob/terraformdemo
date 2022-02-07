resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  associate_public_ip_address = var.assign_public_ip

  tags = {
    Name = var.name
  }
}