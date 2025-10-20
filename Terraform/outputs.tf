output "db_instance_endpoint" {
    description = "The endpoint of the RDS database instance"
    value       = aws_db_instance.test_db.endpoint
}

output "db_instance_id" {
    description = "The ID of the RDS database instance"
    value       = aws_db_instance.test_db.id
}

output "db_instance_address" {
    description = "The address of the RDS database instance"
    value       = aws_db_instance.test_db.address
}
output "db_instance_port" {
    description = "The port of the RDS database instance"
    value       = aws_db_instance.test_db.port
}

