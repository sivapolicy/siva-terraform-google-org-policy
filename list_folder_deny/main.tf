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
  source           = "terraform-google-modules/org-policy/google"
  policy_for       = "folder"
  folder_id        = var.folder_id
  constraint       = "serviceuser.services"
  policy_type      = "list"
  deny             = ["deploymentmanager.googleapis.com"]
  deny_list_length = 1
}

