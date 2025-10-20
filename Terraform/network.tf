# DB Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-mysql-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "rds-mysql-subnet-group"
  }
}

# DB Parameter Group
resource "aws_db_parameter_group" "rds_params" {
  name   = "rds-mysql-params"
  family = "mysql8.0"

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }

  parameter {
    name  = "collation_server"
    value = "utf8mb4_unicode_ci"
  }

  tags = {
    Name = "rds-mysql-params"
  }
}