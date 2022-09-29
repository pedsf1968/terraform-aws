variable "ami" {
   type = string
   default = "ami-036c680a5bac5861d"
   description = "AMI instance in region eu-west-3"
}

variable "availability_zone" {
   type = string
   default = "eu-west-3"
   description = "Zone Europe West"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "Default instance type"
}

variable "key_name" {
  type = string
  default = "AWS-MyWebServer"
  description = "SSH key for connection"
}
