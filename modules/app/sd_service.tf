resource "aws_service_discovery_service" "sd_service" {
  name = "${var.env_name}_${var.tag_name_prefix}_${var.app_name}_sd_service"

  dns_config {
    namespace_id = var.sd_namespace_id

    dns_records {
      ttl  = 100
      type = "A"
    }

    routing_policy = "WEIGHTED"
  }
}