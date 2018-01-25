resource "github_team" "team_name" {
  name        = "${var.team_name}"
  description = "${var.team_description}"
  privacy     = "${var.privacy}"
}

resource "github_team_membership" "member" {
  count    = "${length(var.members)}"
  team_id  = "${github_team.team_name.id}"
  username = "${element(var.members, count.index)}"
  role     = "${replace(var.role, "/admin/", "maintainer")}"
}

resource "github_membership" "member" {
  count    = "${length(var.members)}"
  username = "${element(var.members, count.index)}"
  role     = "${replace(var.role, "/maintainer/", "member")}"
}