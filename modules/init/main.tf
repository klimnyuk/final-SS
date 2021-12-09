provider "aws" {
  region  = var.region
}

terraform {
  backend "s3" {}
}

output "ecr_repository_url" {
  value = aws_ecr_repository.demo_repository.repository_url
}

output "rds_database_url" {
  value = aws_db_instance.default.endpoint
}

output "subnets_ids" {
  value = aws_subnet.private.*.id
}

output "vpc_id" {
  value = aws_vpc.my_VPC.id
}

output "target_group_id" {
    value = aws_alb_target_group.far.id
}

data "aws_ssm_parameter" "dbpass" {
  name = "dbpass"
}