variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID (placeholder for demo)"
  type        = string
  default     = "ami-0123456789abcdef0"
}

variable "app_name" {
  description = "Application name used for tagging"
  type        = string
  default     = "cicd-flask-app"
}