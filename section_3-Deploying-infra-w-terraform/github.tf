# # Configure the GitHub Provider
# I added the
# terraform {
#   required_providers {...}
# part in the other file, as it is required only once per project.

provider "github" {
  token = var.github_token
}

resource "github_repository" "terraform_test_repo" {
    name        = "terraform-test-repo"
    description = "My first repo created with Terraform"
}