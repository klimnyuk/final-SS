provider "aws" {
  region  = "eu-central-1"
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7.33"
  instance_class       = "db.t2.micro"
  name                 = "myydb"
  username             = "admin"
  password             = "iamsolame"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible  = true
}