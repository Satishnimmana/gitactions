
provider "aws" {
  region  = var.region
}
resource "aws_ebs_volume" "ebsvolume" {
  Volume_type = var.volume_type
  availability_zone = "ap-south-1a"
  size = 5
  encrypted = false
  tags = {
    name = "newvolume"
  }

}
