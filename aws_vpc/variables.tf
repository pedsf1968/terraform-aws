variable "vpc-name" {
  type    = string
  default = "my-vpc"
}

variable "vpc-description" {
  type    = string
  default = "Primary VPC"
}

variable "vpc-cidr-block" {
  type    = string
  default = "10.0.0.0/16"
}
