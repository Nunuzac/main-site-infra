terraform {
  backend "s3" {}
}

provider "aws" {
  region = var.aws_default_provider_region
  alias  = "aws-default"
}