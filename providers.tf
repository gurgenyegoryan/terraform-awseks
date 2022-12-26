provider "aws" {

  profile = "telecom.project"
  region  = "eu-west-1"

}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.21"
    }
  }
}