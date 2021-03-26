resource "cloudfoundry_space" "space" {
  count = var.cf_space != "" ? 0 : 1
  name  = "siderite-backend-${local.postfix_name}"
  org   = data.cloudfoundry_org.org.id
}

resource "cloudfoundry_space_users" "users" {
  count      = var.cf_space != "" ? 0 : 1
  space      = cloudfoundry_space.space[0].id
  managers   = [data.cloudfoundry_user.user.id]
  developers = [data.cloudfoundry_user.user.id]
  auditors   = [data.cloudfoundry_user.user.id]
}
