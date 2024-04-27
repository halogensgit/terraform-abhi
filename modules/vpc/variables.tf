variable "project_name" {
  description = "Project name prefix for all resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnets" {
  description = "Map of subnet configurations including CIDR, AZ, and associated route table"
  type = map(object({
    cidr        : string
    az          : string
    route_table : string
  }))
}
