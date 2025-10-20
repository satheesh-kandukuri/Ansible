resource "aws_db_instance" "test_db" {
    instance_class = var.db_instance_class
    allocated_storage = var.allocated_storage
    engine = var.engine
    engine_version = var.engine_version
    username = var.admin_username
    password = var.admin_password
    db_name = var.db_name
    skip_final_snapshot = true
}
