terraform {
  required_version = ">=0.12.0"
}

locals {
  project       = var.project
  projectRegion = var.region
}


resource "google_compute_instance" "vm_instance" {
    name            = "ansible-master"
    machine_type    = var.machine_type
    boot_disk {
        initialize_params {
            image = var.image
        }
    }
    
    network_interface {
        network     = "default"
        access_config = {
        }
    }
    metadata_startup_script = file("master-ansible-start")
    service_account {
    email = var.email
    scopes = ["cloud-platform"]
    } 
}

resource "google_project_service" "compute_googleapis" {
  project = local.project
  service = "compute.googleapis.com"
  disable_dependent_services = true
}


