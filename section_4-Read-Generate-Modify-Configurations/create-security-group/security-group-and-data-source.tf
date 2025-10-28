terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.99.1"
    }
  }
}
provider "aws" {
  region = "eu-central-1"
  profile = "tw-beach"
}

resource "aws_security_group" "my-1st-sg" {
  name = "terraform-1st-sg-http-port"
  description = "Allow HTTP inbound traffic"
  vpc_id = data.aws_vpc.existing_vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_inbound" {
  security_group_id = aws_security_group.my-1st-sg.id
  from_port        = 80
  to_port          = 80
  ip_protocol      = "tcp"
  cidr_ipv4        = data.aws_vpc.existing_vpc.cidr_block
}

resource "aws_vpc_security_group_ingress_rule" "allow-ssh-inbound" {
  security_group_id = aws_security_group.my-1st-sg.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = data.aws_vpc.existing_vpc.cidr_block
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.my-1st-sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}