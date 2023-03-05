terraform {
  required_providers { oci = { source = "oracle/oci" } }
  backend "local" { path = "terraform/state/terraform.tfstate" }
  required_version = ">= 0.13"
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.ssh_private_key
  region           = var.region
}