output "credentials" {
  description = "Siderite credentials"
  value = merge(locals.service_credentials,
    {
      "type" : "siderite",
      "siderite_token" : random_password.password.result,
      "siderite_upstream" : join("", cloudfoundry_route.hsdp_func_gateway.*.endpoint),
      "siderite_auth_type" : var.gateway_auth_type
    }
  )
  sensitive = true
}

output "token" {
  description = "The authentication token for the gateway"
  value       = random_password.password.result
  sensitive   = true
}

output "api_endpoint" {
  description = "The API endpoint of the gateway (when enabled)"
  value       = join("", cloudfoundry_route.hsdp_func_gateway.*.endpoint)
}

output "auth_type" {
  description = "The API gateway auth type"
  value       = var.gateway_auth_type
}
