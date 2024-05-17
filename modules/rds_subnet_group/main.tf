resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.project_name}-rds-subnet-group"
  subnet_ids = var.subnet_ids
  tags = {
    Name        = "${var.project_name}-rds-subnet-group"
    Environment = var.environment_name
  }
}
