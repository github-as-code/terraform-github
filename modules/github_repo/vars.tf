variable "repository_name" {
  description = "The name of the repository that is to be created."
}

variable "admin_teams_count" {
  description = "Required count variable representing number of teams passed to the admin_teams variable"
  default     = 0
}

variable "admin_teams" {
  description = "Admin team members"
  type        = "list"
  default     = []
}

variable "pull_teams_count" {
  description = "Required count variable representing number of teams passed to the pull_teams variable"
  default     = 0
}

variable "pull_teams" {
  description = "Pull team members"
  type        = "list"
  default     = []
}
