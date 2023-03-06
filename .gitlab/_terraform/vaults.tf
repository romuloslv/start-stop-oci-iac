resource "oci_kms_vault" "vault" {
  compartment_id = var.compartment_ocid
  display_name   = "finops"
  vault_type     = "DEFAULT"
}

resource "oci_kms_key" "master_key" {
  compartment_id      = var.compartment_ocid
  display_name        = "master_key"
  protection_mode     = "HSM"
  management_endpoint = oci_kms_vault.vault.management_endpoint
  key_shape {
    algorithm = "AES"
    length    = 32
  }
}

resource "oci_vault_secret" "db_user_qa" {
  compartment_id = var.compartment_ocid
  secret_content {
    content_type = "BASE64"
    content      = base64encode("youruser")
  }
  secret_name = "db_user_qa"
  vault_id    = oci_kms_vault.vault.id
  key_id      = oci_kms_key.master_key.id
}

resource "oci_vault_secret" "db_pass_qa" {
  compartment_id = var.compartment_ocid
  secret_content {
    content_type = "BASE64"
    content      = base64encode("yourpass")
  }
  secret_name = "db_pass_qa"
  vault_id    = oci_kms_vault.vault.id
  key_id      = oci_kms_key.master_key.id
}