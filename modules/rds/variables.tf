variable "project_name" {
  description = "Name of the project, used to prefix resources"
  type        = string
}

variable "db_instance_identifier" {
  description = "The DB instance identifier"
  type        = string
}

variable "engine" {
  description = "The database engine to use"
  type        = string
}

variable "engine_version" {
  description = "The database engine version"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage size in GB"
  type        = number
}

variable "master_username" {
  description = "The master username for the database"
  type        = string
}

variable "master_password" {
  description = "The master password for the database"
  type        = string
  sensitive   = true
}

variable "db_parameter_group_name" {
  description = "The name of the DB parameter group"
  type        = string
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
}

variable "rds_security_group_id" {
  description = "The ID of the RDS security group"
  type        = string
}

variable "monitoring_role_arn" {
  description = "The ARN of the IAM role used for Enhanced Monitoring"
  type        = string
}

variable "backup_retention_period" {
  description = "The number of days to retain backups"
  type        = number
}

variable "backup_window" {
  description = "The preferred backup window"
  type        = string
}

variable "maintenance_window" {
  description = "The preferred maintenance window"
  type        = string
}

variable "deletion_protection" {
  description = "Specifies whether to enable deletion protection"
  type        = bool
}
