variable "morpheus_url" {
  description = "The URL of your MTN Cloud instance (e.g., https://cloud.mtn.com)"
  type        = string
}

variable "morpheus_username" {
  description = "Your MTN Cloud username"
  type        = string
}

variable "morpheus_password" {
  description = "Your MTN Cloud password"
  type        = string
  sensitive   = true
  default     = ""
}

variable "morpheus_access_token" {
  description = "Your MTN Cloud access token (alternative to password)"
  type        = string
  sensitive   = true
  default     = ""
}

variable "morpheus_tenant_subdomain" {
  description = "Your MTN Cloud tenant subdomain (optional, for sub-tenants)"
  type        = string
  default     = ""
}
