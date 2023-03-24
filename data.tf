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
