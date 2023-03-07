<h1>start-stop-oci-iac</h1>
<h3>Enables the management of oci resources</h3>

<br>

## Prerequisites

* Tag created at OCI
* Vault created at OCI
* Variables, schedules, and configuration file created in Gitlab
* Tag the loadbalancer, dbsystem, and instance type resources you want to manage

## Supported services

* Oracle Cloud Compute: On/Off
* Oracle Cloud DBSystem: On/Off
* Oracle Cloud Flexible LB: Up/Down

<br>

## Schedule activities on the oracle_cloud branch

Turn off resources | yourtenancyname | yourcompartmentname  
Turn on resources | yourtenancyname | yourcompartmentname

## Available variables for schedules

ANSIBLE_ENVS ->>
The value of the ANSIBLE_ENVS variable contains the environments where the resources should be changed.  
for example: ANSIBLE_ENVS=@(dev|qa). The resources will be changed in these environments.

ANSIBLE_ACT - > >
The value of the ANSIBLE_ACT variable contains the action to be performed.  
e.g.: ANSIBLE_ACT=stop. Changes the status of the resources in these environments.

The changes must be replicated between active schedules.

e.g.: ANSIBLE_ENVS=@(dev|qa|uat|stg). Changes (starts/stops) resources in these environments.  
e.g.: ANSIBLE_ENVS=@(dev|qa). This keeps the environments uat/stg in their state.

## Default environments

* dev
* qa
* uat
* stg

<br>

<h1>TL;DR</h1>

* create a personal token  
[more info here](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#create-a-personal-access-token)
* create a parent group  
[more info here](https://docs.gitlab.com/ee/user/group/manage.html#create-a-group)
* create a Docker image  
[more info here](https://docs.docker.com/engine/reference/commandline/build/)

Replace 'changeme' with your information in:

docker/requirements/config  
.gitlab/_terraform/terraform.tfvars  
.gitlab/_ansible/manager_resources.

<br>

Run Terraform to upload the required infrastructure

```
$ terraform init
$ terraform fmt
$ terraform validate
$ terraform plan
$ terraform apply -auto-approve
```

<br>

**Configuration examples can be found in the image repository, and general information can be found on the INFO page of the respective root directory.  
Finally, fork this repository on github to your branch created in the gitlab repository. The marked environments will be activated at 07:50 and deactivated at 21:50 Brasilia local time.**