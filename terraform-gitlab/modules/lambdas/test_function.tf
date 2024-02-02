resource "aws_lambda_function" "test_function" {
  function_name = "test_function"
  description   = "test Lambda for acquiring Copernicues climate data"
  filename      = "${path.module}/source_code/test_lambda.zip"
  runtime       = "python3.11"
  role          = aws_iam_role.iam_for_test_lambda.arn
  handler       = "lambda_function.lambda_handler"
  layers        = [aws_lambda_layer_version.test_layer.arn]

  #depends_on = [ aws_lambda_layer_version.test_layer ]

  tags_all = merge(var.tags_common, var.tags_lambdas, )
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_layer_version
resource "aws_lambda_layer_version" "test_layer" {
  filename     = "${path.module}/layers/test_layer.zip"
  layer_name   = "test_layer"
  description  = "test python libraries layer"
  skip_destroy = false

  compatible_runtimes = ["python3.11"]
}

# https://technotrampoline.com/articles/how-to-configure-aws-lambda-cloudwatch-logging-with-terraform/
resource "aws_iam_role_policy_attachment" "function_logging_policy_attachment" {
  role       = aws_iam_role.iam_for_test_lambda.id
  policy_arn = aws_iam_policy.function_logging_policy.arn
}

resource "aws_iam_role" "iam_for_test_lambda" {
  name = "iam_for_test_lambda"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        Action : "sts:AssumeRole",
        Effect : "Allow",
        Principal : {
          "Service" : "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = merge(var.tags_common, var.tags_lambdas, )
}
