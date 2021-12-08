
provider "aws" {
  region  = var.region
}

/*terraform {
  backend "s3" {}
}*/

output "ecr_repository_url" {
  value = aws_ecr_repository.demo_repository.repository_url
}

output "rds_database_url" {
  value = aws_db_instance.default.endpoint
}
