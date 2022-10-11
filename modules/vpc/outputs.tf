
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "sc_db_id" {
  value = aws_security_group.sc_db.id
}


output "sc_ssh_id" {
  value = aws_security_group.sc_ssh.id
}

output "sc_lb_id" {
  value = aws_security_group.sc_lb.id
}

output "sc_apps_id" {
  value = aws_security_group.sc_apps.id
}

output "sc_jenkins_id" {
  value = aws_security_group.sc_jenkins.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet.*.id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnet.*.id
}
