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

resource "aws_security_group" "victor_sg" {
  name        = "victor-sg"
  description = "Security group for Victors resources"
  vpc_id      = data.aws_vpc.victor-vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "victor_sgr_ingress_http" {
  ip_protocol       = "tcp"
  from_port = 80
  to_port =  80
  cidr_ipv4 = "${aws_eip.victor_eip.public_ip}/32"
  security_group_id = aws_security_group.victor_sg.id
}

resource "aws_vpc_security_group_ingress_rule" "victor_sgr_ingress_https" {
  ip_protocol       = "tcp"
  from_port = 443
  to_port =  443
  cidr_ipv4 = var.vpc_ip
  security_group_id = aws_security_group.victor_sg.id
}

resource "aws_eip" "victor_eip" {
  tags = {
    Name = "Victor's EIP"
  }
}

output "my-elastic-ip-as-url-is" {
    value = "https://${aws_eip.victor_eip.public_ip}:8080"
}

output "my-security-group-details" {
  value = aws_eip.victor_eip
}