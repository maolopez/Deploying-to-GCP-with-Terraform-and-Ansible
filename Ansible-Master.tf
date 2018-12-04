resource "google_compute_instance" "vm_instance" {
    name            = "ansible-master"
    machine_type    = "f1-micro"
    boot_disk {
        initialize_params {
            image = "centos-cloud/centos-7-v12345678"
        }
    }
    
    network_interface {
        network     = "default"
        access_config = {
        }
    }
    metadata_startup_script = "${file("master-ansible-start")}" 
    service_account {
    email = "terraform-deployments@project-123456.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
    } 
}

