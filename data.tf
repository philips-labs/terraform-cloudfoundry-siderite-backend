data "cloudfoundry_org" "org" {
  name = var.cf_org_name
}

data "cloudfoundry_user" "user" {
  name   = var.cf_user
  org_id = data.cloudfoundry_org.org.id
}

data "cloudfoundry_domain" "app_domain" {
  name = var.cf_app_domain
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
