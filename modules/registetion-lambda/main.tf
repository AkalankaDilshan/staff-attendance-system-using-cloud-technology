resource "aws_lambda_function" "staff-registetion-lambda" {
  function_name = var.function_name
  role          = var.role_arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"

  #TODO : create path to  lambda code 
}

