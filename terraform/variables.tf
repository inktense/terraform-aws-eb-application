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

variable "instance_type" {
      description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "max_instance_count" {
  type        = number
  description = "Max instance count in auto scaling group"
  default     = 2
}
