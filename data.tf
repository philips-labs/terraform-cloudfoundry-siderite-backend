data "cloudfoundry_org" "org" {
  name = var.cf_org_name
}

data "cloudfoundry_domain" "app_domain" {
  name = data.hsdp_config.config.domain
}

data "cloudfoundry_service" "iron" {
  name = "hsdp-iron"
}

data "hsdp_config" "config" {
  service = "cf"
}

data "cloudfoundry_domain" "domain" {
  name = data.hsdp_config.config.domain
}

data "cloudfoundry_space" "space" {
  count = length(var.cf_space_name) > 0 ? 1 : 0
  org   = data.cloudfoundry_org.org.id
  name  = var.cf_space_name
}
