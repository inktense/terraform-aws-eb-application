variable "aws_region" {
  description = "Region where main resources should be created."
  type        = string
  default     = "eu-west-2"
}

variable "env" {
  description = "Environment name for EB"
  type        = string
  default     = "develop"
}
