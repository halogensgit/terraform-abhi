variable "project_name" {
  description = "Name of the project, used to prefix resources"
  type        = string
}

variable "environment_name" {
  description = "The name of the environment (prod, staging, dev, etc.)"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "alb_subnet_ids" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "The ID of the ALB security group"
  type        = string
}

variable "alb_certificate_arn" {
  description = "The ARN of the ALB ACM certificate"
  type        = string
}

variable "target_group_arn" {
  description = "The ARN of the target group"
  type        = string
}
