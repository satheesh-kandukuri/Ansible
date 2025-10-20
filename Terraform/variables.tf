# Variables
variable "vpc_id" {
  description = "ID of the existing VPC"
  type        = string
  default     = "vpc-058c952484f40a476"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
  default     = ["subnet-05078962cc18414cb", "subnet-097610a3c4be3c0d9"]
}

variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "mydb"
}

variable "db_username" {
  description = "Master username for the database"
  type        = string
  default     = "admin"
}

variable "app_username" {
  description = "Application username for the database"
  type        = string
  default     = "appuser"
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to access the database"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}