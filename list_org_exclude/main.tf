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
module "org-allow-trusted-images" {
  source           = "terraform-google-modules/org-policy/google"
  policy_for       = "organization"
  organization_id  = var.organization_id
  constraint       = "compute.trustedImageProjects"
  policy_type      = "list"
  allow             = ["projects/${var.image_project_id}"]
  allow_list_length = "1"
  exclude_projects  = [var.image_project_id]
}

