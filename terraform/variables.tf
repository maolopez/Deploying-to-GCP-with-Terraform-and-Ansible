variable "project" { 
  default = "playground-s-11-f76abdf7"
}

variable "region" {
  default = "us-central1" 
}

variable "zone" {
  default = "us-central1-c" 
}

variable "cidr" {
  default = "10.0.0.0/16" 
}

variable "machine_type" { 
  default = "f1-micro"
}

variable "image" { 
  default = "centos-cloud/centos-7-v12345678"
}

variable "email" { 
  default = "terraform-deployments@project-123456.iam.gserviceaccount.com"
}
