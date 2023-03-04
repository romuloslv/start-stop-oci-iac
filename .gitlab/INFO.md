# Variables definition

To run the jobs, some variables need to be defined in your project.

<br>

In gitlab

DOCKER_IMAGE: yourimagecreatetorunjob   | e.g: yourdockerhubaccount/docker-img-oci:1.0  
TF_VAR_private_key_path: yourprivatekey | e.g: -----BEGIN PRIVATE KEY-----...  
[more info here](https://docs.gitlab.com/ee/ci/variables/#for-a-project)

<br>

In schedule

ANSIBLE_ACT: youraction | e.g: start/stop  
ANSIBLE_ENVS: yourenvs  | e.g: dev/qa/uat/stg  
[more info here](https://docs.gitlab.com/ee/ci/pipelines/schedules.html#add-a-pipeline-schedule)

<br>

In config file

At vars level on .gitlab/ansible/manager_resources.yml, replace the data with your information.

father_compartment_id_sp: yourtagnamespacecompartment | e.g: ocid1.compartment.oc1...  
compartment_id_sp: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;yourtagscompartment &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | e.g: xx:xx:xx:xx:xx:xx:xx:...  
vault_id_sp: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;yourvaultcompartment &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | e.g: ocid1.compartment.oc1...  
[more info here](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_variables.html#defining-variables-in-a-play)