module "myec2" {
  source = "../Modules/ec2"
  ami           = var.ami_id
  instance_type = var.instance_type
  associate_public_ip_address = var.assign_public_ip
    Name = var.name
}
# I am creating an s3 below 
module "mys3" {
  source = "../modules/s3"
  bucket_name = var.bucket_name
  s3_acl    = var.s3_acl
    s3_Name    = var.s3_bucket_tagname
    s3_Environment = var.env_type
}