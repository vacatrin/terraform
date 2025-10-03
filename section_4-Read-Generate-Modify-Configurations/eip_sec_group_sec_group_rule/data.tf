data "aws_vpc" "victor-vpc" {
    id = "vpc-00a9a992c57fccbe4"
}

variable "vpc_ip" {
  default = "0.0.0.0/0"
}