output "resource_id" {
  value = aws_db_instance.rds.resource_id
}

output "arn" {
  value = aws_db_instance.rds.arn
}

output "rds_host" {
  value = aws_db_instance.rds.endpoint
}

output "db_name" {
  value = aws_db_instance.rds.db_name
}

output "db_port" {
  value = aws_db_instance.rds.port
}

output "db_username" {
  value = aws_db_instance.rds.username
}