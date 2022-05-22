# AWS Credentials
variable "NETWORKING_AWS_ACCESS_KEY_ID" {
  type        = string
  description = "The AWS Access Key ID for Networking-Infrastructure account"
}

variable "NETWORKING_AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = "The AWS Access Secret Key for Networking-Infrastructure account"
  sensitive   = true
}