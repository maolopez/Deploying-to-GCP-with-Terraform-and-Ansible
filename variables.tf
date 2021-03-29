variable "project" { 
  default = "playground-s-11-4e389324"
}

variable "region" {
  default = "northamerica-northeast1" 
}

variable "zone" {
  default = "northamerica-northeast1-a" 
}

variable "cidr" {
  default = "10.0.0.0/16" 
}

variable "subnet" {
  default = "10.162.128.192/24"
}

variable "machine_type" { 
  default = "e2-medium"
}

variable "image" { 
  default = "centos-cloud/centos-7-v20200403"
}

variable "email" { 
  default = "terraform-deployments@playground-s-11-4e389324.iam.gserviceaccount.com"
}