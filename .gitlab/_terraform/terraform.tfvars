compartment_ocid = "changeme"
ssh_private_key  = "changeme"
ssh_public_key   = "changeme"
gitlab_token     = "changeme"
parent_group     = "changeme"
tenancy_ocid     = "changeme"
fingerprint      = "changeme"
user_ocid        = "changeme"
region           = "changeme"

gitlab_list = [
  { key   = "DOCKER_IMAGE", value = "changeme" },
  { key   = "TF_VAR_private_key_path", value = "~/.oci/oci_api_key.pem" },
  { key   = "RUNNER", value = "changeme" }
]
schedule_vars = [
  { key   = "ANSIBLE_ACT", value = "stop" },
  { key   = "ANSIBLE_ACT", value = "start" },
  { key   = "ANSIBLE_ENVS", value = "@(dev|qa|uat|stg)" }
]
