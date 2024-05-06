output "alb_security_group_id" {
  description = "The ID of the ALB security group"
  value       = aws_security_group.alb_sg.id
}


output "ec2_security_group_id" {
  description = "The ID of the EC2 security group"
  value       = aws_security_group.ec2_sg.id
}

output "rds_security_group_id" {
  description = "The ID of the RDS security group."
  value       = aws_security_group.rds_sg.id
}

output "ecs_security_group_id" {
  description = "The ID of the ECS security group."
  value       = aws_security_group.ecs_sg.id
}