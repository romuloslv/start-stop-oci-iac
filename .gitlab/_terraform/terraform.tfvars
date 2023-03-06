compartment_ocid = ""
ssh_private_key  = ""
ssh_public_key   = ""
tenancy_ocid     = ""
fingerprint      = ""
user_ocid        = ""
region           = ""
gitlab_token     = ""

gitlab_list = [
  {
    key   = "DOCKER_IMAGE",
    value = "yourdockerhubaccount/docker-img-oci:1.0"
  },
  {
    key   = "TF_VAR_private_key_path",
    value = "~/.oci/oci_api_key.pem"
  }
]
schedule_vars = [
  {
    key   = "ANSIBLE_ACT",
    value = "stop"
  },
  {
    key   = "ANSIBLE_ACT",
    value = "start"
  },
  {
    key   = "ANSIBLE_ENVS",
    value = "@(dev|qa|uat|stg)"
  }
]