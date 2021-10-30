variable "to_validate" {
  description = "check if either space_name or space_id is provided"
  type        = string
  validation {
    condition     = length(var.to_validate) > 0
    error_message = "Set either the 'cf_space_name' or 'cf_space_id' variable."
  }
}
