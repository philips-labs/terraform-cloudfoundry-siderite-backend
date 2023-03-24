module "siderite_backend" {
  source = "../../"

  enable_gateway = true
  cf_space_id    = var.cf_space_id
}

resource "hsdp_function" "request" {
  name         = "http-request"
  docker_image = "philipslabs/hsdp-task-http-request:v0.2.0"

  environment = {
    REQUEST_METHOD   = "POST"
    REQUEST_URL      = var.hookbin_endpoint_url
    REQUEST_USERNAME = "r0n"
    REQUEST_PASSWORD = "SwaNs0n"
    REQUEST_BODY     = "{}"
  }

  run_every = "1h"

  backend {
    credentials = module.siderite_backend.credentials
  }
}

