data "cloudfoundry_org" "org" {
  name = var.cf_org_name
}

data "cloudfoundry_space" "space" {
  count = var.cf_space != "" ? 1 : 0
  name  = var.cf_space
  org   = data.cloudfoundry_org.org.id
}

data "cloudfoundry_user" "user" {
  name   = var.cf_user
  org_id = data.cloudfoundry_org.org.id
}

data "cloudfoundry_domain" "app_domain" {
  name = data.hsdp_config.config.domain
}

data "cloudfoundry_service" "iron" {
  name = "hsdp-iron"
}

data "cloudfoundry_service" "metrics" {
  name = "hsdp-metrics"
}

data "hsdp_config" "config" {
  region  = var.cf_region
  service = "cf"
}

data "cloudfoundry_domain" "domain" {
  name = data.hsdp_config.config.domain
}
