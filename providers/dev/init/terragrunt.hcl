terraform {
  source = "../../../modules//init"
}

include {
  path = find_in_parent_folders()
}

locals {
  secrets = read_terragrunt_config(find_in_parent_folders("secrets.hcl"))
}

inputs = merge (
  local.secrets.inputs,
  {
  working_dir = format("%s/../../../app", get_terragrunt_dir())
}
)