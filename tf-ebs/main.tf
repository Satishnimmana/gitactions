resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.ebs_availability_zone
  size              = var.ebs_size
  
  tags = {
    Name = var.ebs_name
  }
}