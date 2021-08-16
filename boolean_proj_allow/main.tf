terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.78.0"
    }
  }
} 

/******************************************
  Provider configuration
 *****************************************/
provider "google" {
  # Configuration options
  version     = "~> 3.53"
  region      = "asia-south1"
  zone        = "asia-south1-c"
  /* credentials = "${file("service-account.json")}" */
}

/******************************************
  Apply the constraint using the module
 *****************************************/
module "org-disable-serial-port-access" {
  source          = "terraform-google-modules/org-policy/google"
  policy_for      = "project"
  project_id      = var.project_id
  constraint      = "compute.disableSerialPortAccess"
  policy_type     = "boolean"
  enforce         = false
}

