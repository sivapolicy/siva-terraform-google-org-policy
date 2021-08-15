variable "folder_id" {
  description = "The folder id for putting the policy"
  type        = string
  default     = "322253467278" // Production folder
}

variable "policy_for" {
  description = "Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`."
  type        = string
  default     = "folder" // This is for my understanding
}
