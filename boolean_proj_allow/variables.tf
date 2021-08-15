variable "project_id" {
  description = "The project ID to apply the policy to"
  type        = string
  default     = "linear-trees-320904" // My First Project
}

variable "policy_for" {
  description = "Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`."
  type        = string
  default     = "project" // This is for my understanding
}
