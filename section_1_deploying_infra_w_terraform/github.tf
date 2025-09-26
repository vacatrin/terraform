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
  token = "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"
}

resource "github_repository" "terraform_test_repo" {
    name        = "terraform-test-repo"
    description = "My first repo created with Terraform"
}