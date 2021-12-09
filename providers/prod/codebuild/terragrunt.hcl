terraform {
  source = "../../../modules//codebuild"
}

include {
  path = find_in_parent_folders()
}

dependency "cluster" {
  config_path = "../cluster"
  skip_outputs = true
}

dependency "init" {
    config_path = "../init"
    mock_outputs = {
    ecr_repository_url = "000000000000.dkr.ecr.eu-central-1.amazonaws.com/my-app"
    rds_database_url = "terraform-00000000000000000000000000.c4opmngmt9rk.eu-central-1.rds.amazonaws.com:3306"
  }
}

inputs = {
  build_spec_file = "providers/dev/buildspec.yml"
  rds_database_url = dependency.init.outputs.rds_database_url
}