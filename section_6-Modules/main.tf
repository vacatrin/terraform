# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 6.0"
#     }
#   }
# }
#
provider "aws" {
  region  = var.region
  profile = "tw-beach"
}
#
variable "region" {
  default = "eu-central-1"
}
#
# variable "victor_subnet_id" {
#   default = "subnet-04e73c468c9dadca9"
# }
#
# variable "ec2_ami" {
#   default = "ami-08697da0e8d9f59ec"
# }

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.1.4"
  subnet_id = "subnet-052677552e1a7cdf3"
}

