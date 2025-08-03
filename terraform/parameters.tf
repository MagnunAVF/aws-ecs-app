resource "aws_ssm_parameter" "MY_CUSTOM_ENV" {
  name  = format("%s-my-custom-env", var.service_name)
  type  = "String"
  value = "my-custom-value"
}