# This file contains the variable definitions for the Terraform configuration.

# Define a variable for the GitHub token, that will be taken from env variable TF_VAR_github_token
variable "github_token" {
    description = "The GitHub token to use for authentication"
    type        = string
    sensitive   = true
}

variable "ec2_ami" {
  default = "a_default_ami_id" # in case I have no values added in a *.tfvars file
}