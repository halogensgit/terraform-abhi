variable "project_name" {
  description = "The project name used for creating resources"
  type        = string
}

variable "environment_name" {
  description = "The environment name (e.g., prod, dev, staging)"
  type        = string
}

variable "region" {
  description = "The AWS region where resources will be created"
  type        = string
}
