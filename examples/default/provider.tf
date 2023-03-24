provider "hsdp" {
  region       = var.cf_region
  uaa_username = var.cf_user
  uaa_password = var.cf_password
}

provider "cloudfoundry" {
  api_url  = data.hsdp_config.cf.url
  user     = var.cf_user
  password = var.cf_password
}
