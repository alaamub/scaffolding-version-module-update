terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.34.0"
    }

    github = {
      source  = "integrations/github"
      version = "5.45.0"
    }

    google = {
      source  = "hashicorp/google"
    }

    null = {
      version = "~> 3.0"
    }
  }
}
