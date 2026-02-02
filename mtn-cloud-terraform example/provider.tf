terraform {
  required_providers {
    morpheus = {
      source  = "gomorpheus/morpheus"
      version = "0.14.0"
    }
  }
}

provider "morpheus" {
  url              = var.morpheus_url
  # username         = var.morpheus_username
  # password         = var.morpheus_password
  access_token     = var.morpheus_access_token
  # tenant_subdomain = var.morpheus_tenant_subdomain
  secure   = true
}
