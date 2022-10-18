
provider "aws" {
  region  = var.region
}
resource "aws_ebs_volume" "ebs_volume" {
#  volume_id   = aws_ebs_volume.ebs_volume.id 
  availability_zone = var.ebs_availability_zone
  size              = var.ebs_size
  type              = "gp2"
  
  tags = {
    Name = var.ebs_name
  }
}