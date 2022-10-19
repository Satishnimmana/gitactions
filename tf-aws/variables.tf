
variable "ec2_instance_name" {
  type = string
}
variable "ec2_instance_type" {
  type = string
}
variable "ec2_count"{
  type  = string
}
variable "region"{
  type = string
}
variable "ami_name" {
  default = "ubuntu"

  validation {
    condition     = can(regex("amazon|RHEL|ubuntu", var.ami_name))
    error_message = "Invalid ami name, allowed_values = [amazon  RHEL ubuntu]."
  }
}
variable"environment"{
  type = string
}
variable"subnet_1a"{
  type = string
}