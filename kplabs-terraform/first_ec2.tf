# Always make use of docs from https://registry.terraform.io/browse/providers

# always need to specify a provider
provider "aws" {
  region     = "eu-central-1"
  access_key = "ACCESS_KEY"
  secret_key = "SECRET_KEY"
}

# always need to provide resource from the provider
resource "aws_instance" "my_ec2_instance" {
  ami = "ami-02ccbe126fe6afe82"
  instance_type = "t2.micro"
  tags = {
    Name = "My 1st tf instance"
  }
}