output "test" {
  value = terraform.workspace
}

output "Jenkins_URL" {
  value = module.ecs.jenkins_load_Balancer_url
}

output "Apps_URL" {
  value = module.ecs.app_load_Balancer_url
}