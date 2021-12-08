variable "region" {
  default = "eu-central-1"
}

variable "app_name" {
  type    = string
  default = "my-best-app"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "tag" {
  type    = string
  default = "v0.0"
}

variable "working_dir" {
    type    = string
    default = "../app"
}

variable "dbuser" {
    type    = string
    default = "admin"
}

variable "dbpass" {
  default = "value"
    type    = string
}

variable "dbname" {
    type    = string
    default = "mydb"
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
