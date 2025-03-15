variable "git_token" {
  type        = string
  description = "GitHub token for accessing the repository"
  sensitive   = true # Marks the variable as sensitive
}
