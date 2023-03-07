<h1>Ansible-Terraform-OCI</h1>

* Ansible 2.13.7
* Terraform 1.3.9
* OCI cli 3.23.0
* Python 3.8.10

```
$ docker login
$ docker build --no-cache -t yourdockerhubaccount/docker-img-oci:1.0 .
$ docker push yourdockerhubaccount/docker-img-oci:1.0
```

You must replace the requirements/config file with your information.

[more info here](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/sdkconfig.htm#Example_Configuration)