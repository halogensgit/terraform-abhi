variable "project_name" {
  description = "Name of the project, used to prefix resources"
  type        = string
}

variable "environment_name" {
  description = "The name of the environment (prod, staging, dev, etc.)"
  type        = string
}
