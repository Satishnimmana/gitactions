
provider "aws" {
  region  = var.region
}
resource "aws_ebs_volume" "ebsvolume" {
  availability_zone = "ap-south-1a"
  size = var.size
  encrypted = false
  tags = {
    name = "newvolume"
  }

}
