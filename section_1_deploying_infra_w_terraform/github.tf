terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = var.github_token
}

resource "github_repository" "terraform_test_repo" {
    name        = "terraform-test-repo"
    description = "My first repo created with Terraform"
}