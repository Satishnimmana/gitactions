# use ubuntu 20 AMI for EC2 instance
data "aws_ami" "amzlinux2" {
  most_recent      = true
  owners           = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]      ##this is a latest version AMI install the linux 
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
terraform {
    backend "remote" {
      organization = "awsclouds"
    workspaces {
        name = "clouds"
        }
    }
}

# provision to us-east-1 region
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux2.id
  instance_type = "t2.micro"
  key_name      = "newkey"
tags = {
    Name = var.instance_name
  }
}