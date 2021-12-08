terraform {
  source = "../../../modules//cluster"
}

include {
  path = find_in_parent_folders()
}

dependency "init" {
    config_path = "../init"
    mock_outputs = {
      ecr_repository_url = "000000000000.dkr.ecr.eu-central-1.amazonaws.com/my-app"
      subnets_ids        = ["subnet-00000000000", "subnet-111111111111"]
      vpc_id             = "vpc-000000000000"
      target_group_id    = "arn:aws:elasticloadbalancing:eu-central-1:000000000000:targetgroup/my-target-group/3d56b5f39b56430a"
  }
}

inputs = {
    ecr_repository_url = dependency.init.outputs.ecr_repository_url
    subnets_ids        = dependency.init.outputs.subnets_ids
    vpc_id             = dependency.init.outputs.vpc_id
    target_group_id    = dependency.init.outputs.target_group_id
  }