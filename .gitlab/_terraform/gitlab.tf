data "gitlab_group" "parent_group" {
  full_path = var.parent_group
}

resource "gitlab_group" "oracle_cloud" {
  name             = "Oracle Cloud"
  path             = "oracle-cloud"
  parent_id        = data.gitlab_group.parent_group.id
  visibility_level = "private"
}

resource "gitlab_project" "finops_oci" {
  name         = "finops-oci"
  namespace_id = gitlab_group.oracle_cloud.id
}

resource "gitlab_branch" "oracle_cloud" {
  name    = "oracle_cloud"
  ref     = "main"
  project = gitlab_project.finops_oci.id
}

resource "gitlab_project_variable" "finops_oci_variable" {
  for_each = { for v in var.gitlab_list : v.key => v.value }
  project  = gitlab_project.finops_oci.id
  key      = each.key
  value    = each.key != "TF_VAR_private_key_path" ? each.value : file(each.value)
}

resource "gitlab_pipeline_schedule" "start" {
  project       = gitlab_project.finops_oci.id
  description   = "Turn on resources | yourtenancyname | yourcompartmentname"
  ref           = "oracle_cloud"
  cron          = "05 07 * * 1-5"
  cron_timezone = "America/Sao_Paulo"
  active        = true
}

resource "gitlab_pipeline_schedule" "stop" {
  project       = gitlab_project.finops_oci.id
  description   = "Turn off resources | yourtenancyname | yourcompartmentname"
  ref           = "oracle_cloud"
  cron          = "05 21 * * 1-5"
  cron_timezone = "America/Sao_Paulo"
  active        = true
}

resource "gitlab_pipeline_schedule_variable" "start" {
  for_each             = { for v in var.schedule_vars : v.key => v.value if v.value == "start" || v.key == "ANSIBLE_ENVS" }
  project              = gitlab_pipeline_schedule.start.project
  pipeline_schedule_id = gitlab_pipeline_schedule.start.id
  key                  = each.key
  value                = each.value
}

resource "gitlab_pipeline_schedule_variable" "stop" {
  for_each             = { for v in var.schedule_vars : v.key => v.value if v.value == "stop" || v.key == "ANSIBLE_ENVS" }
  project              = gitlab_pipeline_schedule.stop.project
  pipeline_schedule_id = gitlab_pipeline_schedule.stop.id
  key                  = each.key
  value                = each.value
}