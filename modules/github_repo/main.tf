resource "github_repository" "repository" {
  name = "${var.repository_name}"

  # Our repos should always be public. If you need to make something secret you better have a good reason
  private = false

  # We auto init so that github_branch_protection works
  auto_init = true
}

resource "github_branch_protection" "branch" {
  # As part of our SDLC we require that master branch can not be merged to unless...

  repository = "${var.repository_name}"
  branch     = "master"

  # enforce protection on admins
  enforce_admins = true

  # all status checks pass
  required_status_checks {
    strict         = true
    contexts       = []
  }

  # Tune review requirements
  required_pull_request_reviews {
    dismiss_stale_reviews = true
    require_code_owner_reviews = true
  }
  
  

  depends_on = ["github_repository.repository"]
}

resource "github_team_repository" "admin_teams" {
  count      = "${var.admin_teams_count}"
  team_id    = "${element(var.admin_teams, count.index)}"
  repository = "${github_repository.repository.id}"
  permission = "admin"
}

resource "github_team_repository" "pull_teams" {
  count      = "${var.pull_teams_count}"
  team_id    = "${element(var.pull_teams, count.index)}"
  repository = "${github_repository.repository.id}"
  permission = "pull"
}
