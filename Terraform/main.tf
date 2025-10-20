# RDS MySQL Instance
resource "aws_db_instance" "mysql" {
  identifier             = "mysql-db-instance"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp3"
  storage_encrypted      = true
  
  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  #parameter_group_name   = aws_db_parameter_group.rds_params.name
  
  publicly_accessible    = false
  skip_final_snapshot    = true
  #backup_retention_period = 7
  
# enabled_cloudwatch_logs_exports = ["error", "general", "slowquery"]

}