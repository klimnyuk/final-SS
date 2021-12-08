variable "region" {}

variable "tag" {
  type    = string
}

variable "zones_count" {}

variable "port" {
  default = 80
}

variable "fargate_memory" {
  default = 512
}

variable "fargate_cpu" {
  default = 256
}

variable "ecr_repository_url" {
  type = string
}

variable "app_name" {
  type    = string
}

variable "env" {
  type    = string
}

variable "subnets_ids" {
  type        = list(string)
}

variable "vpc_id" {
  type = string
}

variable "target_group_id" {
  type = string
}