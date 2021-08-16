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
module "org-disable-ipv6-for-compute-engines" {
  source          = "terraform-google-modules/org-policy/google"
  policy_for      = "organization"
  organization_id = var.organization_id
  constraint      = "compute.disableAllIpv6"
  enforce         = true
  policy_type     = "boolean"
  exclude_folders = ["folders/${var.excluded_folder_id}"]
}

