terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.26"
    }
  }
}
 
provider "aws" {
  profile = "default"
  region  = var.aws_region
  access_key = "AKIA4TWBMGDL6PMEC36G"
  secret_key = "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"
}