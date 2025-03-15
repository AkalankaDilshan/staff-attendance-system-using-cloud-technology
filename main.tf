provider "aws" {
  region = "us-east-1"
}

# module "aws_kinesis_video_signaling_channel" {
#   source                 = "./modules/kinesis_video_streaming"
#   streaming_channel_name = "my-signaling-channel"
# }

module "aws_amplify_app" {
  source     = "./modules/amplify"
  app_name   = "staff_attendance_app"
  repository = "https://github.com/AkalankaDilshan/Clndance-System-WebApplication-T3-stack.git"
  git_token  = var.git_token
}
