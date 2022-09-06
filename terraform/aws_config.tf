terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # version = "~> 3.26"
      version = "~> 4.22.0"
    }
  }
}
 
provider "aws" {
  shared_config_files      = ["C:\\Users\\kaust\\.aws\\config"]
  shared_credentials_files = ["C:\\Users\\kaust\\.aws\\credentials"]
  profile                  = "kaustubhmali"
  region                   = var.aws_region
}

# get the latest AMI id from Amazon
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# get the avaliability zone from Amazon
data "aws_availability_zones" "available" {
  state = "available"

  filter {
    name   = "zone-type"
    values = ["availability-zone"]
  }
}