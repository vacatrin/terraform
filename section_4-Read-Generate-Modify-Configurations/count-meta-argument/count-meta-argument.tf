terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region  = "eu-central-1"
  profile = "tw-beach"
}

variable "ec2_names" {
    type = list(string)
    default = ["model", "view", "controller"]
}

resource "aws_instance" "count_ec2_instance" {
    count = 3
    ami = "ami-0444794b421ec32e4"
    instance_type = "t2.micro"
    subnet_id = "subnet-0cfa755fef421a92c"
    tags = {
        Name = "${var.ec2_names[count.index]}-instance"
        Order_of_creation = count.index
    }
}
