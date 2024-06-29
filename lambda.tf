resource "aws_lambda_function" "my_lambda" {
  function_name = "my_lambda_function"
  role          = aws_iam_role.lambda_role.arn
  handler       = "com.example.MyLambdaFunction::handleRequest"
  runtime       = "java11"
  timeout       = 10
  memory_size   = 128

  filename         = "build/distributions/deploy-java-lambda-function-using-terraform-1.0-SNAPSHOT.zip"
  source_code_hash = filebase64sha256("build/distributions/deploy-java-lambda-function-using-terraform-1.0-SNAPSHOT.zip")

  environment {
    variables = {
      key = "value"
    }
  }
}

output "lambda_function_name" {
  value = aws_lambda_function.my_lambda.function_name
}