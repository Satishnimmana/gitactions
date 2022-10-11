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
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

backend_config:{
      hostname: app.terraform.io
      organization: awsclouds
      token: ${{ secrets.TF_API_TOKEN }}
      workspaces:
        name: clouds # note there's no leading `-`
}
# provision to us-east-1 region
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux2.id
  instance_type = "t2.nano"
  key_name      = "newkey"

  tags = {
    Name = "var.ec2_instance_name"
  }
}