variable "organization_id" {
  description = "The organization id for putting the policy"
  type        = string
  default     = "673158110274" // Organization ID.
}

variable "image_project_id" {
  description = "The ID of a project to trust images from"
  type        = string
  default     = "image/linear-trees-320904" // My First Project
}

variable "policy_for" {
  description = "Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`."
  type        = string
  default     = "Organization" // This is for my understanding
}
