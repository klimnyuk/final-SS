variable "region" {}

variable "app_name" {
  type    = string
}

variable "env" {
  type    = string
}

variable "tag" {
  type    = string
}

variable "working_dir" {
    type    = string
}

variable "dbuser" {
    type    = string
}

variable "dbname" {
    type    = string
}

variable "port" {
  default = 80
}

variable "zones_count" {}