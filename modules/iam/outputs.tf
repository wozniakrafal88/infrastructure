output "s3_iam_profile" {
  value = aws_iam_instance_profile.s3_profile.name
}

output "rds_iam_profile" {
  value = aws_iam_instance_profile.rds_profile.name
}

output "rds_to_ec2_iam_profile" {
  value = aws_iam_instance_profile.rds_to_ec2_profile.name
}

output "s3_jenkins_to_ec2_profile" {
  value = aws_iam_instance_profile.s3_jenkins_to_ec2_profile.name
}
output "s3_iam_role_arn" {
  value = aws_iam_role.iam_role_s3.arn
}

output "rds_iam_role_arn" {
  value = aws_iam_role.iam_role_rds.arn
}