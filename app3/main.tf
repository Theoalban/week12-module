terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }

  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"

}
locals {
  env ="dev"
}
output "my-var" {
    value = local.env
  
}
module "week7Mod" {
    source = "github.com/Theoalban/terraform-week7"
  
}