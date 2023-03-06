resource "oci_identity_tag_namespace" "create_tag_namespace" {
  compartment_id = var.compartment_ocid
  description    = "These are tags for the children of the your compartment"
  name           = "yourtag-oci"
  is_retired     = false
}

resource "oci_identity_tag" "create_tag1" {
  tag_namespace_id = oci_identity_tag_namespace.create_tag_namespace.id
  description      = "Define the environment"
  name             = "env"
  is_cost_tracking = true
  is_retired       = false
  validator {
    validator_type = "ENUM"
    values         = ["dev", "qa", "uat", "stg"]
  }
}

resource "oci_identity_tag" "create_tag2" {
  tag_namespace_id = oci_identity_tag_namespace.create_tag_namespace.id
  description      = "Define the owner"
  name             = "owner"
  is_cost_tracking = false
  is_retired       = false
}