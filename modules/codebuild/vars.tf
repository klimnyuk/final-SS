variable "rds_database_url" {
    type    = string
}

variable "dbuser" {
    type    = string
}

variable "dbpass" {
    type    = string
}

variable "dbname" {
    type    = string
}

variable "region" {}

variable "repository" {
    type = string 
}

variable "github_oauth_token" {
    type = string 
}

variable "build_spec_file" {
    type = string 
}

variable "app_name" {
  type    = string
}

variable "env" {
  type    = string
}

variable "branch_pattern" {
  type = string
}