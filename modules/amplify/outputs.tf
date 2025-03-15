output "amlify_app_arn" {
  description = "The ARN of the Amlify app"
  value       = aws_amplify_app.staff_attendance_app.arn
}
output "amlify_app_default_domain" {
  description = "The default domain of the Amlify App"
  value       = aws_amplify_app.staff_attendance_app.default_domain
}
