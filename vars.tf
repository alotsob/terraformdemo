/*
variable "ami_id"{}
variable "instance_type"{}
variable "name_id" {}
variable "cidr_id" {}
variable "name_vpcid" {}
variable "cidrRt_id" {}
variable "cidrsubnet_id" {}
variable "availabilty_zone_id"{} 
*/

variable "ami_id"{}
type = map 
rhel = ""
linux = ""
windows = "" 
variable "instance_type"{
    type = list
    default = [t2.nano, t2.micro, t2.small]
}