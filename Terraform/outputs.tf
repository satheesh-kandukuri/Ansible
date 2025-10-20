# Outputs
output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.mysql.endpoint
}

output "rds_address" {
  description = "RDS instance address"
  value       = aws_db_instance.mysql.address
}

output "master_secret_arn" {
  description = "ARN of the master credentials secret"
  value       = aws_secretsmanager_secret.rds_master_credentials.arn
}

output "app_user_secret_arn" {
  description = "ARN of the app user credentials secret"
  value       = aws_secretsmanager_secret.rds_app_user_credentials.arn
}

output "db_name" {
  description = "Database name"
  value       = aws_db_instance.mysql.db_name
}