resource "random_integer" "default" {
  min = 10000
  max = 99999
}

module "example" {
  source                   = "../.."
  name                     = "tf-example-${random_integer.default.result}"
  delay_seconds            = var.delay_seconds
  maximum_message_size     = var.maximum_message_size
  message_retention_period = var.message_retention_period
  visibility_timeout       = var.visibility_timeout
  polling_wait_seconds     = var.polling_wait_seconds
}