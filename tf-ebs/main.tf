
provider "aws" {
  region  = var.region
}
resource "aws_ebs_volume" "ebsvolume" {
  availability_zone = "ap-south-1a"
  size = 10
  encrypted = false
  tags = {
    name = "newvolume"
  }

}