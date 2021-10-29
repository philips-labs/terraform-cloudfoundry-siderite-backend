variable "cf_user" {
  type = string
}

variable "cf_password" {
  type = string
}

variable "cf_org_name" {
  type = string
}

variable "cf_space_name" {
  type = string
}

variable "cf_region" {
  type = string
}

variable "hookbin_endpoint_url" {
  default = "Go to https://hookbin.com to generate a new endpoint"
  type    = string
}

