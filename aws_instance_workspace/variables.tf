variable "region" {
  default = "eu-west-3"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  type = map(any)
  default = {
    "ProjectA" = "ami-0493936afbe820b28",
    "ProjectB" = "ami-064736ff8301af3ee"
  }
}