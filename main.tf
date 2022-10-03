# use ubuntu 20 AMI for EC2 instance
data "aws_ami" "ubuntu" {
    most_recent = true
filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/*20.04-amd64-server-*"]
    }
filter {
        name   = "virtualization-type"
        values = ["hvm"]
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
# provision to us-east-2 region
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = "app-ssh-key"
tags = {
    Name = var.instance_name
  }
}