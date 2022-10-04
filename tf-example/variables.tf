
variable "ec2_name" {
  type = string
  default = ${{ github.event.inputs.ec2-name }}
}