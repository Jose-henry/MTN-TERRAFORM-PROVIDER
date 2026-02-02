resource "morpheus_vsphere_instance" "ubuntu_server" {
  name          = "terraform-ubuntu-server"
  description   = "Provisioned via Terraform"
  
  # IDs required for placement (Retrieve these via Morpheus CLI/UI)
  cloud_id      = 4   # REPLACE with your Cloud ID
  group_id      = 73   # REPLACE with your Group ID
  plan_id       = 3882   # REPLACE with your Plan ID
  
  # Configuration details
  instance_type_id = 89 # REPLACE with Instance Type ID (e.g., Apache, Nginx, Ubuntu)
  instance_layout_id = 309 # REPLACE with Layout ID
  resource_pool_id = 105 # REPLACE with Resource Pool ID
  # tenant_id = 72
  # Networking (Example configuration)
  interfaces {
    network_id = 151 # REPLACE with your Network ID
  }
}

# NOTE: The above resource is commented out because you need to select the correct
# resource type for your cloud (e.g., morpheus_vsphere_instance, morpheus_aws_instance)
# and fill in the correct IDs.
# See steps.md for details.
