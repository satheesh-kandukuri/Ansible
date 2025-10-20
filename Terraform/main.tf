

# Generate random password for RDS master user
resource "random_password" "master_password" {
  length  = 16
  special = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# Secrets Manager Secret for RDS Master Credentials
resource "aws_secretsmanager_secret" "rds_master_credentials" {
  name                    = "rds-mysql-master-credentials"
  description             = "Master credentials for RDS MySQL instance"
  recovery_window_in_days = 7
}

resource "aws_secretsmanager_secret_version" "rds_master_credentials" {
  secret_id = aws_secretsmanager_secret.rds_master_credentials.id
  secret_string = jsonencode({
    username = var.db_username
    password = random_password.master_password.result
    engine   = "mysql"
    host     = aws_db_instance.mysql.address
    port     = aws_db_instance.mysql.port
    dbname   = var.db_name
  })
}

# Generate random password for application user
resource "random_password" "app_user_password" {
  length  = 16
  special = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# Secrets Manager Secret for Application User Credentials
resource "aws_secretsmanager_secret" "rds_app_user_credentials" {
  name                    = "rds-mysql-app-user-credentials"
  description             = "Application user credentials for RDS MySQL"
  recovery_window_in_days = 7
}

resource "aws_secretsmanager_secret_version" "rds_app_user_credentials" {
  secret_id = aws_secretsmanager_secret.rds_app_user_credentials.id
  secret_string = jsonencode({
    username = var.app_username
    password = random_password.app_user_password.result
    engine   = "mysql"
    host     = aws_db_instance.mysql.address
    port     = aws_db_instance.mysql.port
    dbname   = var.db_name
  })
}

# RDS MySQL Instance
resource "aws_db_instance" "mysql" {
  identifier             = "mysql-db-instance"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp3"
  storage_encrypted      = true
  db_name                = var.db_name
  username               = var.db_username
  password               = random_password.master_password.result
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  publicly_accessible    = false
  skip_final_snapshot    = true
}







