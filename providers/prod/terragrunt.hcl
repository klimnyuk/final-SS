locals {
    app_name = "my-app"
    env = "prod"
    region = "us-east-2"
    tag = "v0.0"
    profile = "default"
    zones_count = "2"
    repository = "https://github.com/klimnyuk/final-SS"
    branch_pattern = "dev"
    dbuser = "admin"
    dbname = "mydatabase"

}

inputs = {
    app_name = local.app_name
    env = local.env
    region = local.region
    tag = local.tag
    profile = local.profile
    zones_count = local.zones_count
    repository = local.repository
    branch_pattern = local.branch_pattern
    dbuser = local.dbuser
    dbname = local.dbname
}

remote_state {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = format("%s-%s-%s", local.app_name, local.env, local.region)
    key            = format("%s/terraform.tfstate", path_relative_to_include())
    region         = local.region
    dynamodb_table = format("tflock-%s-%s-%s", local.env, local.app_name, local.region)
    profile        = local.profile
  }
}