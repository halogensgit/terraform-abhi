variable "project_name" {
  description = "Name of the project, used to prefix resources"
  type        = string
}

variable "region" {
  description = "AWS region to deploy resources into"
  default     = "ap-northeast-2"  # Seoul
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnets" {
  description = "Map of subnet configurations"
  type        = map(object({
    cidr        : string
    az          : string
    route_table : string
  }))
}

variable "environment_name" {
  description = "The name of the environment (prod, staging, dev, etc.)"
  type        = string
}
