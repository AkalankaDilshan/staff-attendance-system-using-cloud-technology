resource "aws_amplify_app" "staff_attendance_app" {
  name        = var.app_name
  repository  = var.repository
  oauth_token = var.git_token
}

resource "aws_amplify_branch" "staff_attendance_app_branch" {
  app_id      = aws_amplify_app.staff_attendance_app.id
  branch_name = var.branch_name
}
