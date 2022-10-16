locals {
    allowed_os = {
        "amazon": {owner: "amazon",       filter: "amzn2-ami-hvm*"},
        "RHEL":   {owner: "amazon",       filter: "*RHEL*"},
        "ubuntu": {owner: "099720109477", filter: "*ubuntu-bionic-18.04-amd64-*"},
    }
}

data "aws_ami" "os" {
  for_each = local.allowed_os

  most_recent = true
  owners      = [each.value.owner]
  filter {
    name   = "name"
    values = [each.value.filter]
  }
}