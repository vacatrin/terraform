terraform {
    required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "~> 6.0"
          configuration_aliases = [ aws.dev ]
        }
    }
}

resource aws_security_group "prod-sg" {
  name        = "victor_modules_test"
  vpc_id = "vpc-045c2de25d492d0db"
}

resource aws_security_group "dev-sg" {
    name        = "victor_modules_test"
    vpc_id =       "vpc-04753fa43cc46a573"
    provider    = aws.dev
}