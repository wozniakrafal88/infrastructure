output "key_name" {
  value = aws_key_pair.key_pair.key_name
}

output "ec2_jenkins_id" {
  value = aws_instance.ec2_jenkins.id
}