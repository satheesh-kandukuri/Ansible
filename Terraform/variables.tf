
# Using variables for configuration
variable "admin_username" {
  description = "The username for the database admin"
  type        = string
  default     = "admin"
}

variable "admin_password" {
  description = "The password for the database admin"
  type        = string
  default     = "password"
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "test_db"
}

variable "db_instance_class" {
  description = "The instance class for the database"
  type        = string
  default     = "db.t2.micro"
}

variable "allocated_storage" {
  description = "The allocated storage for the database in GB"
  type        = number
  default     = 20
}
variable "engine" {
  description = "The database engine"
  type        = string
  default     = "mysql"
}
variable "engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "8.0"
}

