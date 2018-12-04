# Deploying-to-GCP-with-Terraform-and-Ansible

**Purpose** The first step is deploying an Ansible-Master VM on your GCP project from your local machine and after that a second step is for that Ansible-Master VM to deploy a third VM on GCP internally. The idea of the whole ecercise is to do it totally automated.

### Requirements before to start:

1. A GCP Accountwith a project.
2. Create a Service Account for Terraform with Compute Engine Owner role: terraform-deployments@project-123456.iam.gserviceaccount.com
3. Create a Service Account for Ansible with Compute Engine viewer role. Download its JSON file and rename it service-account.json: 12345678901-compute@developer.gserviceaccount.com
4. Create an startup scrip [master-Ansible-start] for ANSIBLE that includes dynamic inventory installation: (https://devopscube.com/ansible-dymanic-inventry-google-cloud/)
5. Create a separate ".tf" file in order to pass your GCP credentials.
