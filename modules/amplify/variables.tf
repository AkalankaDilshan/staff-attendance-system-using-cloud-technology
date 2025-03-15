variable "app_name" {
  description = "name for amlify app"
  type        = string
}

variable "repository" {
  description = "git repo URL"
  type        = string
}

variable "git_token" {
  description = "github token for authonticate"
  type        = string
  sensitive   = true
}

variable "branch_name" {
  description = "repo branch for loading"
  type        = string
  default     = "main"
}
