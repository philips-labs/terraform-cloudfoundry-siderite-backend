variable "cf_region" {
  description = "The CF region to deploy into"
  type        = string
}

variable "cf_org_name" {
  description = "Cloudfoundry ORG name to use for reverse proxy"
  type        = string
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

variable "function_gateway_image" {
  description = "Image to use for Function Gateway app. Use a v* tagged version to prevent automatic updates"
  default     = "philipslabs/hsdp-func-gateway:latest"
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
  type = string
  description = "The Iron plan to use"
  default = "dev-large-encrypted"
}
