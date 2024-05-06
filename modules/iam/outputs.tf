output "iam_role_arn" {
  description = "The ARN of the IAM role created for EC2 instances to use with SSM."
  value       = aws_iam_role.ec2_ssm_role.arn
}
