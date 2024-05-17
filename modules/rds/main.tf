resource "aws_db_instance" "rds_instance" {
  identifier                            = var.db_instance_identifier
  engine                                = var.engine
  engine_version                        = var.engine_version
  instance_class                        = var.instance_class
  allocated_storage                     = var.allocated_storage
  storage_type                          = "gp3"
  storage_encrypted                     = true
  publicly_accessible                   = false
  vpc_security_group_ids                = [var.rds_security_group_id]
  db_subnet_group_name                  = var.db_subnet_group_name
  parameter_group_name                  = var.db_parameter_group_name
  username                              = var.master_username
  password                              = var.master_password
  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  performance_insights_kms_key_id       = null
  monitoring_interval                   = 60
  monitoring_role_arn                   = var.monitoring_role_arn
  backup_retention_period               = var.backup_retention_period
  backup_window                         = var.backup_window
  maintenance_window                    = var.maintenance_window
  deletion_protection                   = var.deletion_protection
  multi_az                              = false
  apply_immediately                     = true
  skip_final_snapshot                   = true


  tags = {
    Name = "${var.project_name}-rds"
  }
}
