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
  credentials = "${file("service-account.json")}"
}

/******************************************
  Provider configuration
 *****************************************/
/* provider "google" {
  version = "~> 3.53"
} */

/******************************************
  Apply the constraint using the module
 *****************************************/
module "org-disable-serial-port-access" {
  source          = "terraform-google-modules/org-policy/google"
  policy_for      = "project"
  project_id      = var.project_id
  constraint      = "compute.disableSerialPortAccess"
  policy_type     = "boolean"
  enforce         = true
}

