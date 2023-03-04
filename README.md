# start-stop-oci-iac
<h3>Enables the management of oci resources</h3>
<br>

## Prerequisites

* Tag created at OCI
* Vault created at OCI
* Variables created in gitlab, schedules and config file
* Tag the loadbalancer, dbsystem, instance type resources you want to manage

## Supported services

* Oracle Cloud Compute: On/Off
* Oracle Cloud DBSystem: On/Off
* Oracle Cloud Flexible LB: Up/Down

<br>

## Schedules actives on branch oracle_cloud

Turn off resources | yourtenancyname | yourcompartmentname  
Turn on resources | yourtenancyname | yourcompartmentname

## Available variables on schedules

ANSIBLE_ENVS ->>
The value of the ANSIBLE_ENVS variable contains the environments where the resources will be modified.  
e.g: ANSIBLE_ENVS=@(dev|qa). Will modify resources in these environments.

ANSIBLE_ACT ->>
The value of the ANSIBLE_ACT variable contains the action to be performed.  
e.g: ANSIBLE_ACT=stop. Will modify the status of resources in these environments.

Changes must be replicated between active schedules.

e.g: ANSIBLE_ENVS=@(dev|qa|uat|stg). Will modify(start/stop) resources in these environments.  
e.g: ANSIBLE_ENVS=@(dev|qa). Thus, the environments uat/stg will remain with their status.

## Default environments

* dev
* qa
* uat
* stg

<br>

`p.s: Configuration examples can be found in the image repository. For general information, access the INFO page of each root directory.`
