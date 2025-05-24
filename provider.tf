/*
provider "aws" {
    #alias = "aws-us-east-1"
    region = "us-east-1"
}

provider "aws" {
    alias = "aws-us-west-2"
    region = "us-west-2"
    assume_role {
        role_arn = "arn:aws:iam::123456789012:role/role_name"
        session_name = "session_name"
    }
}
data "aws_secretsmanager_secret" "demo_secret" {
    provider = aws.aws-us-west-2
    arn = "arn:aws:secretsmanager:us-west-2:123456789012:secret:demo_secret"
}
data "aws_secretsmanager_secret" "demo_secret_01" {
  provider = aws.aws-us-west-2
  # The ARN of the secret to retrieve
  arn = "arn:aws:secretsmanager:us-west-2:123456789012:secret:example-123456"
}
*/