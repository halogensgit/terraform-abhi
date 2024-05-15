variable "project_name" {
  description = "Name of the project, used to prefix resources"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to be used in the RDS subnet group"
  type        = list(string)
}

variable "environment_name" {
  description = "The name of the environment (prod, staging, dev, etc.)"
  type        = string
}
