output "jenkins_load_Balancer_url" {
  value = aws_lb.jenkins_load_balancer.dns_name
}

output "app_load_Balancer_url" {
  value = aws_lb.load_balancer.dns_name
}