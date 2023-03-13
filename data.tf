data "aws_ami" "amzon_linux" {
  most_recent = true

  filter {
    name   = "description"
    values = ["Amazon Linux 2 Kernel 5.10*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "default" {
  default = true
}