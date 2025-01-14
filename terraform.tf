terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }

    github = {
      source  = "integrations/github"
    }

    google = {
      source  = "hashicorp/google"
    }

    null = {
      version = "~> 3.0"
    }
  }
}
