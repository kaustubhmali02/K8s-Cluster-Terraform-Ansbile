terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.26"
    }
  }
}
 
provider "aws" {
  profile = "kaustubhmali"
  region  = var.aws_region
  access_key = "empty"
  secret_key = "empty"
}