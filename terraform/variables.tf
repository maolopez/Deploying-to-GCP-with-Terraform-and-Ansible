variable "project" { 
  default = "playground-s-11-0a0d5e9e"
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
  default = "centos-cloud/centos-7-v20200403"
}

variable "email" { 
  default = "terraform-deployments@playground-s-11-0a0d5e9e.iam.gserviceaccount.com"
}
