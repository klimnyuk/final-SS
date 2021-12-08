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

variable "dbpass" {
    type    = string
}

variable "dbname" {
    type    = string
}







variable "port" {
    default = 80
}

variable "zones_count" {
    default = 2
}








variable "fargate_memory" {
  default = 512
}

variable "fargate_cpu" {
  default = 256
}
