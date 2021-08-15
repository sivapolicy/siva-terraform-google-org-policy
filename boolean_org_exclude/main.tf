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
module "org-disable-ipv6-for-compute-engines" {
  source          = "terraform-google-modules/org-policy/google"
  policy_for      = "organization"
  organization_id = var.organization_id
  constraint      = "compute.disableAllIpv6"
  enforce         = true
  policy_type     = "boolean"
  exclude_folders = ["folders/${var.excluded_folder_id}"]
}

