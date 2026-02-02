# Step-by-Step Guide to Provisioning on MTN Cloud with Terraform

## 1. Prerequisites
-   **Terraform**: Ensure Terraform is installed (`terraform -version`).
-   **Credentials**: Have your MTN Cloud URL, Username, and Password (or Access Token) ready.

## 2. Project Setup
Create a new directory for your project and create the following files inside it.

### A. `provider.tf`
This file configures the Morpheus provider.
```hcl
terraform {
  required_providers {
    morpheus = {
      source  = "gomorpheus/morpheus"
      version = "0.12.0"
    }
  }
}

provider "morpheus" {
  url              = var.morpheus_url
  username         = var.morpheus_username
  password         = var.morpheus_password
  # access_token     = var.morpheus_access_token     # Uncomment if using token
  # tenant_subdomain = var.morpheus_tenant_subdomain # Uncomment if using sub-tenant
}
```

### B. `variables.tf`
This file defines the variables used in `provider.tf`.
```hcl
variable "morpheus_url" { type = string }
variable "morpheus_username" { type = string }
variable "morpheus_password" { type = string; sensitive = true; default = "" }
variable "morpheus_access_token" { type = string; sensitive = true; default = "" }
variable "morpheus_tenant_subdomain" { type = string; default = "" }
```

### C. `terraform.tfvars`
This file contains your secrets. **Do not share this file.**
```hcl
morpheus_url      = "https://console.cloud.mtn.ng/"
morpheus_username = "your_username"
morpheus_password = "your_password"
# morpheus_access_token = "your_token_if_using_token"
# morpheus_tenant_subdomain = "your_subdomain_if_needed"
```

### D. `main.tf`
This file contains your resources.

#### Option 1: Using a Catalog Item (Recommended for OpenStack)
Since the specific `morpheus_openstack_instance` resource is not available in the latest provider, the best way to provision to OpenStack is to create a **Catalog Item** in the Morpheus UI (Library -> Blueprints -> Catalog Items) that provisions your OpenStack instance, and then order it via Terraform.

```hcl
resource "morpheus_instance_catalog_item" "openstack_server" {
  name = "My OpenStack Server"
  # ... (See docs for full catalog item configuration)
}
```
*Alternatively, you can use the generic `morpheus_instance` resource if you downgrade the provider to version `0.9.9`.*

#### Option 2: Testing Connectivity
To simply test that Terraform can talk to MTN Cloud, use this:
```hcl
resource "morpheus_environment" "tf_test" {
  name   = "Terraform Test Env"
  code   = "tf_test"
  active = true
}
```

## 3. Initialization
Open your terminal in the project directory and run:
```powershell
terraform init
```

## 4. Deployment
1.  **Verify**: Run `terraform plan`.
2.  **Apply**: Run `terraform apply` and type `yes` to confirm.

## 5. Cleanup
To remove the resources, run:
```powershell
terraform destroy
```
