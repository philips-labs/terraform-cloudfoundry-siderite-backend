variable "cf_region" {
  description = "The CF region to deploy into"
  type        = string
}

variable "cf_org_name" {
  description = "Cloudfoundry ORG name to use for reverse proxy"
  type        = string
}

variable "cf_space" {
  description = "The space where to deploy components to. If not specified a new space will be created"
  type        = string
  default     = ""
}

variable "cf_user" {
  description = "The Cloudfoundry user to assign rights to the app to"
  type        = string
}

variable "name_postfix" {
  type        = string
  description = "The postfix string to append to the space, hostname, etc. Prevents namespace clashes"
  default     = ""
}

variable "enable_gateway" {
  type        = bool
  description = "Enable a gateway endpoint so you can trigger functions through HTTPS"
  default     = true
}

variable "gateway_auth_type" {
  type        = string
  description = "Enable authorization for endpoints on the gateway. Supported types: ['none', 'token', 'iam']"
  default     = "token"
  validation {
    condition     = can(contains(["token", "iam", "none"], var.gateway_auth_type))
    error_message = "Only values supported are 'none', 'token' and 'iam'."
  }
}

variable "auth_iam_region" {
  type        = string
  description = "IAM region"
  default     = "us-east"
}

variable "auth_iam_environment" {
  type        = string
  description = "IAM environment"
  default     = "client-test"
}

variable "auth_iam_orgs" {
  type        = list(string)
  description = "List of IAM ORG IDs to allow"
  default     = []
}

variable "auth_iam_roles" {
  type        = list(string)
  description = "The roles within the IAM ORG that grants access"
  default     = []
}

variable "auth_iam_client_id" {
  type        = string
  description = "The IAN OAuth2 client ID"
  default     = ""
}

variable "auth_iam_client_secret" {
  type        = string
  description = "The IAM OAuth2 client secret"
  default     = ""
}

variable "function_gateway_image" {
  description = "Image to use for Function Gateway app. Use a v* tagged version to prevent automatic updates"
  default     = "philipslabs/hsdp-func-gateway:v0.3.0"
  type        = string
}

variable "environment" {
  type        = map(any)
  description = "Pass environment variable to the app"
  default     = {}
}

variable "docker_username" {
  type        = string
  description = "Docker registry username"
  default     = ""
}

variable "docker_password" {
  type        = string
  description = "Docker registry password"
  default     = ""
}

variable "gateway_memory" {
  type        = number
  description = "Gateway memory"
  default     = 64
}

variable "gateway_disk_quota" {
  type        = number
  description = "Gateway disk quota"
  default     = 1024
}

variable "iron_plan" {
  type        = string
  description = "The Iron plan to use"
  default     = "dev-large-encrypted"
}
