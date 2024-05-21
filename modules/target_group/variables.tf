variable "project_name" {
  description = "Name of the project, used to prefix resources"
  type        = string
}

variable "environment_name" {
  description = "The name of the environment (prod, staging, dev, etc.)"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the target group will be created"
  type        = string
}

variable "port" {
  description = "The port on which targets receive traffic"
  type        = number
}

variable "health_check_path" {
  description = "The destination for the health check requests"
  type        = string
  default     = "/"
}
