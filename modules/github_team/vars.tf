variable "team_name" {
  description = "Name of the team."
}

variable "team_description" {
  description = "Team description."
}

variable "privacy" {
  description = "Privacy level of the team."
  default     = "closed"
}

variable "members" {
  description = "List of members of the team."
  type        = "list"
}

variable "role" {
  description = "Role time of the members"
  default     = "member"
}
