# Outputs
output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.mysql.endpoint
}

output "rds_arn" {
  description = "RDS instance ARN"
  value       = aws_db_instance.mysql.arn
}

output "rds_db_name" {
  description = "Database name"
  value       = aws_db_instance.mysql.db_name
}