
provider "aws" {
  region  = var.region
}
resource "aws_ebs_volume" "ebsvolume" {
  availability_zone = "ap-south-1a"
  volume-size = var.volume_size
  encrypted = false
  tags = {
    name = "newvolume"
  }

}
