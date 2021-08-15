variable "organization_id" {
  description = "The organization id for putting the policy"
  type        = string
  default 	  = "673158110274" // ID of the organization
}

variable "excluded_folder_id" {
  description = "ID of a folder to exclude from the policy"
  type        = string
  default     = "322253467278" // Exclude Production folder
}

variable "policy_for" {
  description = "Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`."
  type        = string
  default     = "organization" // This is for my understanding
}
