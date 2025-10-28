# Always make use of docs from https://registry.terraform.io/browse/providers
terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 6.0"
        }
        github = {
          source  = "integrations/github"
          version = "~> 6.0"
        }
    }
}

# always need to specify a provider
provider "aws" {
  region  = "eu-central-1"
  profile = "tw-beach"
}

# always need to provide resource from the provider
resource "aws_instance" "my_ec2_instance" {
  ami = var.ec2_ami
  instance_type = "t2.micro"
  subnet_id = "subnet-0cdf86daa1eb620ea"
  tags = {
    Name = "My 1st tf instance"
  }
}

