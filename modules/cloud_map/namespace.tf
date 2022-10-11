resource "aws_service_discovery_private_dns_namespace" "sd_namespace" {
  name        = "${var.env_name}_${var.tag_name_prefix}_sd_namespace"
  description = "${var.env_name}_${var.tag_name_prefix}_sd_namespace"
  vpc         = var.vpc_id
}