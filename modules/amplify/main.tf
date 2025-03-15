resource "aws_amplify_app" "staff_attendance_app" {
  name        = var.app_name
  repository  = var.repository
  oauth_token = var.git_token

  build_spec = <<-EOT
    version: 1
    frontend:
      phases:
        preBuild:
          commands:
            - npm install  # Use npm install instead of npm ci
        build:
          commands:
            - npm run build
      artifacts:
        baseDirectory: build
        files:
          - '**/*'
  EOT
}

resource "aws_amplify_branch" "staff_attendance_app_branch" {
  app_id      = aws_amplify_app.staff_attendance_app.id
  branch_name = var.branch_name

  environment_variables = {
    ENV = "production"
  }

  enable_auto_build = true

}
