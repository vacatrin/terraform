# Always make use of docs from https://registry.terraform.io/browse/providers

# always need to specify a provider
provider "aws" {
  region  = "eu-central-1"
  profile = "tw-beach"
}

# always need to provide resource from the provider
resource "aws_instance" "my_ec2_instance_2" {
  ami = "ami-0444794b421ec32e4"
  instance_type = "t2.micro"
  subnet_id = "subnet-0cdf86daa1eb620ea"
  tags = {
    Name = "My 1st tf instance"
  }
}

