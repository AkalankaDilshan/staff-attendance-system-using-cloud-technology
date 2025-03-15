resource "aws_kinesis_video_stream" "webrtc_channel" {
  name = var.streaming_channel_name
  # type = "SINGLE_MASTER"
  tags = {
    Environment = "dev"
    Project     = "cloud staff attendance"
  }
}
