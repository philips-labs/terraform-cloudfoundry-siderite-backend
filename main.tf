resource "random_id" "id" {
  byte_length = 8
}

resource "random_password" "password" {
  length = 16
}

locals {
  postfix_name = var.name_postfix != "" ? var.name_postfix : random_id.id.hex
}

resource "cloudfoundry_app" "hsdp_func_gateway" {
  name         = "hsdp-func-gateway"
  space        = cloudfoundry_space.space.id
  memory       = var.gateway_memory
  disk_quota   = var.gateway_disk_quota
  docker_image = var.function_gateway_image
  docker_credentials = {
    username = var.docker_username
    password = var.docker_password
  }
  environment = var.environment

  routes {
    route = cloudfoundry_route.hsdp_func_gateway.id
  }
  service_binding {
    service_instance = cloudfoundry_service_instance.iron.id
  }
}

resource "cloudfoundry_route" "hsdp_func_gateway" {
  domain   = data.cloudfoundry_domain.app_domain.id
  space    = cloudfoundry_space.space.id
  hostname = "hsdp-func-gateway-${local.postfix_name}"

  depends_on = [cloudfoundry_space_users.users]
}

resource "cloudfoundry_service_instance" "iron" {
  name         = "iron"
  space        = cloudfoundry_space.space.id
  service_plan = data.cloudfoundry_service.iron.service_plans[var.iron_plan]

  depends_on = [cloudfoundry_space_users.users]
}

resource "cloudfoundry_service_key" "iron" {
  name             = "key"
  service_instance = cloudfoundry_service_instance.iron.id
}

resource "cloudfoundry_service_instance" "metrics" {
  name         = "metrics"
  space        = cloudfoundry_space.space.id
  service_plan = data.cloudfoundry_service.metrics.service_plans["metrics"]

  depends_on = [cloudfoundry_space_users.users]
}
