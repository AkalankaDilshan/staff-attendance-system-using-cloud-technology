provider "aws" {
  region = "us-east-1"
}

module "aws_kinesis_video_signaling_channel" {
  source                 = "./modules/kinesis_video_streaming"
  streaming_channel_name = "my-signaling-channel"
}
