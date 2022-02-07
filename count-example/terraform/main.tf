resource "aws_instance" "jjtech" {
  count =length(var.ame)
  ami = ""
  instance_type = "t2.micro"
  tags = {
      Name = var.name[count.index]
  }

}

variable "name" {
    type = list(string)
    default = [ "test1","test2", "test3" ]
}