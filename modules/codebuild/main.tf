provider "aws" {
  region  = var.region
}

terraform {
  backend "s3" {}
}

data "aws_ssm_parameter" "dbpass" {
  name = "dbpass"
}