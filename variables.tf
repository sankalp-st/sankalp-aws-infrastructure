variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0f5ee92e2d63afc18"
}

variable "repo_url" {
  description = "GitHub repository URL for Node.js application"
  type        = string
}
