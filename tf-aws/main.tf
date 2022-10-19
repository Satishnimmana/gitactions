
provider "aws" {
  region  = var.region
}

resource "aws_instance" "linux" {
  ami           = data.aws_ami.os[var.ami_name].id
  instance_type = var.ec2_instance_type
  key_name      = "newkey"
  count = var.ec2_count
  tags = {
    Name= "${var.ec2_instance_name}.${var.environment}-ec2"
  }
}