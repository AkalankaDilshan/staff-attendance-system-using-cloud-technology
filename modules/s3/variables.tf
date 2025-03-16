variable "bucket_prefix" {
  description = "perfix for s3 bucket"
  type        = string
  default     = "staff-attendance"
}

variable "environment" {
  description = "s3 environment"
  type        = string
  default     = "development"
}
