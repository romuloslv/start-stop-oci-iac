terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.110.0"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "15.9.0"
    }
  }
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

provider "gitlab" {
  token = var.gitlab_token
}