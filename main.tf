terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.61.0"
    }
  }
}

locals {
  project  = var.project
  region   = var.region
  zone     = var.zone
  enabled_google_api = toset([
    "compute.googleapis.com",
    "serviceusage.googleapis.com",
    "cloudresourcemanager.googleapis.com"])
}

resource "google_project_service" "enable_googleapis" {
  for_each = local.enabled_google_api
  project = var.project
  service = each.value
  disable_dependent_services = false
  disable_on_destroy = false
}

resource "google_compute_address" "ansible_static" {
  name = "ansible-address"
  address_type = "EXTERNAL"
  region = var.region
}

resource "google_compute_instance" "ansible_instance" {
    name            = "ansible-master"
    machine_type    = var.machine_type
    boot_disk {
        initialize_params {
            image = var.image
        }
    }
    
    network_interface {
        network     = "default"
        subnetwork  = "default"
        access_config {
          nat_ip = google_compute_address.ansible_static.address
        }
    }
    metadata_startup_script = file("master-ansible-start")
    service_account {
    email = var.email
    scopes = ["cloud-platform"]
    } 
  }
