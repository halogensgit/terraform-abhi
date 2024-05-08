output "instance_id" {
  value       = aws_instance.jumper.id
  description = "The ID of the instance"
}

output "instance_public_ip" {
  value       = aws_instance.jumper.public_ip
  description = "The public IP address assigned to the instance"
}

variable "instance_subnet" {
  description = "The key name of the subnet in which the EC2 instance will be created."
  type        = string
}
