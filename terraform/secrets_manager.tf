resource "aws_secretsmanager_secret" "MY_CUSTOM_SECRET" {
  name = format("%s-custom-secret", var.service_name)
}

resource "aws_secretsmanager_secret_version" "MY_CUSTOM_SECRET" {
  secret_id = aws_secretsmanager_secret.MY_CUSTOM_SECRET.id
  # TODO: move to tf vars
  secret_string = "my-custom-secret-value"
}