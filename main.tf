locals {
  postfix_name = var.name_postfix != "" ? var.name_postfix : random_id.id.hex
  space_id     = length(var.cf_space_id) > 0 ? var.cf_space_id : data.cloudfoundry_space.space[0].id
}

resource "random_id" "id" {
  byte_length = 4
}

resource "random_password" "password" {
  length  = 32
  special = false
}

resource "cloudfoundry_app" "hsdp_func_gateway" {
  count        = var.enable_gateway ? 1 : 0
  name         = "hsdp-func-gateway-${local.postfix_name}"
  space        = local.space_id
  memory       = var.gateway_memory
  disk_quota   = var.gateway_disk_quota
  docker_image = var.function_gateway_image
  strategy     = "blue-green"

  docker_credentials = {
    username = var.docker_username
    password = var.docker_password
  }
  environment = merge(var.environment,
    {
      GATEWAY_AUTH_TYPE : var.gateway_auth_type
      AUTH_IAM_REGION : var.auth_iam_region
      AUTH_IAM_ENVIRONMENT : var.auth_iam_environment
      AUTH_IAM_ORGS : join(",", var.auth_iam_orgs)
      AUTH_IAM_ROLES : join(",", var.auth_iam_roles)
      AUTH_IAM_CLIENT_ID : var.auth_iam_client_id
      AUTH_IAM_CLIENT_SECRET : var.auth_iam_client_secret
      AUTH_TOKEN_TOKEN : random_password.password.result
      IRON_CONFIG : templatefile("${path.module}/templates/iron_config.json", {
        cluster_id = local.service_credentials["cluster_info_0_cluster_id"]
        pubkey     = local.service_credentials["cluster_info_0_pubkey"]
        user_id    = local.service_credentials["cluster_info_0_user_id"]
        email      = local.service_credentials["email"]
        password   = local.service_credentials["password"]
        token      = local.service_credentials["token"]
        project    = local.service_credentials["project"]
        project_id = local.service_credentials["project_id"]
        base_url   = var.base_url
      })
    }
  )

  routes {
    route = cloudfoundry_route.hsdp_func_gateway[0].id
  }
}

resource "cloudfoundry_route" "hsdp_func_gateway" {
  count    = var.enable_gateway ? 1 : 0
  domain   = data.cloudfoundry_domain.app_domain.id
  space    = local.space_id
  hostname = "hsdp-func-gateway-${local.postfix_name}"
}

resource "cloudfoundry_service_instance" "iron" {
  count        = length(var.iron_credentials) > 0 ? 0 : 1
  name         = "iron-${local.postfix_name}"
  space        = local.space_id
  service_plan = data.cloudfoundry_service.iron.service_plans[var.iron_plan]

  replace_on_service_plan_change = true
}

resource "cloudfoundry_service_key" "iron" {
  count            = length(var.iron_credentials) > 0 ? 0 : 1
  name             = "key"
  service_instance = cloudfoundry_service_instance.iron[0].id
}

module "validate_space_variables" {
  source = "./modules/validate_space_variables"

  to_validate = "${var.cf_space_name}${var.cf_space_id}"
}
