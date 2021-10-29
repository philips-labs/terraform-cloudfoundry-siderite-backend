output "function_endpoint" {
  value = hsdp_function.request.endpoint
}

output "iron_username" {
  value     = module.siderite_backend.credentials.email
  sensitive = true
}

output "iron_password" {
  value     = module.siderite_backend.credentials.password
  sensitive = true
}
