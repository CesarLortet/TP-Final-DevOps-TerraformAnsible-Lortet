 terraform {
     required_providers {
       aws = {
         source = "hashicorp/aws"
         version = "~>3.0"
       }
     }
   }

 data "aws_ami" "ubuntu" {
    most_recent = true
 
    filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
 
    filter {
      name   = "virtualization-type"
      values = ["hvm"]
    }
 
    owners        = ["099720109477"] # Canonical
  }

 resource "aws_instance" "server_cesar" {
   ami           = data.aws_ami.ubuntu.id
   instance_type = "t2.large"
   key_name = "tp_dev_ynov"
   
   tags = {
     Name = "Instance Lortet"
   }
 }
