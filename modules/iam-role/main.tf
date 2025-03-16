resource "aws_iam_role" "lambda_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

data "aws_iam_policy_document" "polices" {
  version = "2012-10-17"

  #Allow S3 action
  statement {
    effect = "Allow"
    actions = [
      "s3:*"
    ]
    resources = ["*"]
  }

  #Allow Rekognition action 
  statement {
    effect = "Allow"
    actions = [
      "rekognition:*"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "dynamodb:*"
    ]
    resources = ["*"]
  }

  # Allow CloudWatch Logs actions 
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["*"]
  }
}

# Create IAM Policy 
resource "aws_iam_policy" "custom_policy" {
  name        = "rekognition_s3_dynamodb_policy"
  description = "Policy for lambda function to access s3,dynamodb,sns"
  policy      = data.aws_iam_policy_document.polices
}

#Attach policy to IAM Role 
resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.custom_policy.arn
}
