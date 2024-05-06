variable "project_name" {
  description = "The name of the project to prefix for resources"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}

variable "office_ip" {
  description = "CIDR block for the office IP to allow SSH access to EC2"
  type        = string
}


variable "alb_sg_name" {
  description = "Name of the ALB security group."
  type        = string
  default     = "alb-sg"
}

variable "ec2_sg_name" {
  description = "Name of the EC2 security group."
  type        = string
  default     = "ec2-sg"
}

variable "rds_sg_name" {
  description = "Name of the RDS security group."
  type        = string
  default     = "rds-sg"
}

variable "ecs_sg_name" {
  description = "Name of the ECS security group."
  type        = string
  default     = "ecs-sg"
}