output "credentials" {
  description = "Iron credentials"
  value = merge(cloudfoundry_service_key.iron.credentials,
    {
      "siderite_token" : random_password.password.result,
      "siderite_upstream" : cloudfoundry_route.hsdp_func_gateway.endpoint
    }
  )
}
