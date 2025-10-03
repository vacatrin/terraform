provider "aws" {
  region  = "eu-central-1"
  profile = "tw-beach"
}

resource "aws_eip" "my_eip" {
  tags = {
    Name = "Victor's EIP"
  }
}