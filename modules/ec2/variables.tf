variable "ami_id" {
  type        = string
  description = "The AMI ID to use for the instance"
}

variable "instance_type" {
  type        = string
  description = "The type of instance to start"
  default     = "t3a.small"
}

variable "key_name" {
  type        = string
  description = "The key name to use for the instance"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet to associate with the instance"
}

variable "security_group_id" {
  type        = string
  description = "The ID of the security group to associate with the instance"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Whether to associate a public IP address with an instance in a VPC"
  default     = true
}

variable "volume_size" {
  type        = number
  description = "The size of the volume in gigabytes"
  default     = 20
}

variable "iam_instance_profile_name" {
  type        = string
  description = "The IAM instance profile to associate with the instance"
}

variable "project_name" {
  type        = string
  description = "Project name used for tagging and naming resources"
}

