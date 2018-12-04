#Add information about GCP
provider "google" {
    credentials = "${file("terraform-key.json")}"
    project     = "ansible-123456"
    region      = "us-east1"
    zone        = "us-east1-b"
}
