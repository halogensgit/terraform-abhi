output "iam_role_arn" {
  description = "The ARN of the IAM role created for EC2 instances to use with SSM."
  value       = aws_iam_role.ec2_ssm_role.arn
}

output "iam_role_name" {
  value       = aws_iam_role.ec2_ssm_role.name
  description = "The name of the IAM role for EC2 instances"
}

output "iam_instance_profile_arn" {
  description = "The ARN of the IAM instance profile for EC2 instances."
  value       = aws_iam_instance_profile.ec2_ssm_instance_profile.arn
}

output "iam_instance_profile_name" {
  description = "The name of the IAM instance profile for EC2 instances."
  value       = aws_iam_instance_profile.ec2_ssm_instance_profile.name
}


