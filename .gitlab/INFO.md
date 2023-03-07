<h1>Definition of the variables</h1>

To execute the orders, some variables must be defined in your project.

<br>

In Gitlab

DOCKER_ IMAGE: yourimagecreatetorunjob | e.g.: yourdockerhubaccount/docker-img-oci:1.0  
TF_ VAR _private_key_path: yourprivatekey | e.g.: ----- BEGIN PRIVATE KEY -----...  
[more info here](https://docs.gitlab.com/ee/ci/variables/#for-a-project)

In schedule

ANSIBLE_ ACT: youraction | e.g.: start/stop  
ANSIBLE_ENVS : yourenvs | e.g.: dev/qa/uat/stg  
[more info here](https://docs.gitlab.com/ee/ci/pipelines/schedules.html#add-a-pipeline-schedule)

In the configuration file

At vars level in .gitlab/ansible/manager_resources.yml, replace the data with your information.

father_compartment_id_sp: yourtagnamespacecompartment | e.g.: ocid1.compartment.oc1...  
compartment_id_sp: yourtagscompartment | e.g.: xx:xx:xx:xx:xx:xx:xx:...  
vault_id_sp: yourvaultcompartment | e.g: ocid1.compartment.oc1...  
[more info here](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_variables.html#defining-variables-in-a-play)