data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

resource "null_resource" "import_source_credentials" {
    provisioner "local-exec" {
    command = "aws --region ${data.aws_region.current.name} codebuild import-source-credentials --token ${var.github_oauth_token} --server-type GITHUB --auth-type PERSONAL_ACCESS_TOKEN"
  }
}

resource "aws_codebuild_project" "example" {
  name          = "${var.app_name}-${var.env}"
  description   = "test_codebuild_project"
  build_timeout = "5"
  service_role  = aws_iam_role.example.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode = true


    environment_variable {
      name  = "app_name"
      value = "${var.app_name}"
    }
    environment_variable {
      name  = "env"
      value = "${var.env}"
    }
    environment_variable {
      name  = "Account_ID"
      value = "${data.aws_caller_identity.current.account_id}"
    }
    environment_variable {
      name  = "dbuser"
      value = "${var.dbuser}"
    }
    environment_variable {
      name  = "dbname"
      value = "${var.dbname}"
    }
    environment_variable {
      name  = "dbpass"
      value = "${aws_ssm_parameter.secret.value}"
    }
    environment_variable {
      name  = "dbhost"
      value = "${var.rds_database_url}"
    }
  }

  source {
    type                = "GITHUB"
    location            = var.repository
    git_clone_depth     = 1
    buildspec           = var.build_spec_file
    report_build_status = "true"
  }
}

resource "aws_codebuild_webhook" "example" {
  project_name = aws_codebuild_project.example.name
  build_type   = "BUILD"

  filter_group {
    filter {
      type    = "EVENT"
      pattern = "PUSH"
    }

    filter {
      type    = "HEAD_REF"
      pattern = var.branch_pattern
    }
  }
}

  resource "aws_ssm_parameter" "secret" {
  name        = "/production/database/password/master"
  description = "The parameter description"
  type        = "SecureString"
  value       = var.dbpass
}