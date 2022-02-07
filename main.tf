# provider "aws" {
#     region = "us-east-1"
#     access_key = ""
#   secret_key = ""
# }
  
# resource "aws_instance" "web" {
#   ami = var.ami_id
#    instance_type = var.instance_type

#    tags = {
#     Name =  "name_id"
#   }
# }

#1. Create vpc
/*
resource "aws_vpc" "DemoVpc" {
  cidr_block       = var.cidr_id
  instance_tenancy = "default"

  tags = {
    Name = var.name_vpcid
  }
}
#2. Create internet gateway
resource "aws_internet_gateway" "DemoIgw" {
  vpc_id = aws_vpc.DemoVpc.id
}
#2. Create Custome route table
resource "aws_route_table" "DemoRT" {
  vpc_id = aws_vpc.DemoVpc.id

  route {
    cidr_block = var.cidrRt_id
    gateway_id = aws_internet_gateway.DemoIgw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_internet_gateway.DemoIgw.id
  }

  tags = {
    Name = "DemoIgw"
  }
}
#4. Create a subnet 
resource "aws_subnet" "DemoSubnet" {
  vpc_id     = aws_vpc.DemoVpc.id
  cidr_block = var.cidrsubnet_id
  availability_zone = var.availabilty_zone_id

  tags = {
    Name = "DemoSubnet"
  }
}
#5. Assocaite subnet with Route Table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.DemoSubnet.id
  route_table_id = aws_route_table.DemoRT.id
}
# Create security grps to allow port 22, 80, 443
resource "aws_security_group" "allow_http" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.DemoVpc.id

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [ "0.0.0.0/0"]
  }
  ingress {
    description      = "HTTPS"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [ "0.0.0.0/0"]
  }
  ingress {
    description      = "HTTPS"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [ "0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_http"
  }
}
#7.Create a network interface with an IP in the subnet that was created in step 4.
resource "aws_network_interface" "Demonic" {
  subnet_id       = aws_subnet.DemoSubnet.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.allow_http.id]
}
#8. Assign elastic IP to the network interface created in 7.
resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.Demonic.id 
  associate_with_private_ip = "10.0.1.50"
  depends_on = [ aws_internet_gateway.DemoIgw]
}
#.9 Create Ubuntu server and install/enable Apache
resource "aws_instance" "web-server-instance" {
  ami = "ami-0b0ea68c435eb488d"
  instance_type = "t2.micro"
  availability_zone = var.availabilty_zone_id
  key_name = "NovaMac.KP"
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.Demonic.id
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install apache2 -y
              sudo systemctl start apache2
              sudo bash -c 'echo your first web server > /var/www/html/index.html'
              EOF
    tags = {
      Name = "web-server"       

  }

}
*/