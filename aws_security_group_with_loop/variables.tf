variable "ami" {
  type = map(any)
  default = {
    "eu-west-3-ami"    = "ami-0ddab716196087271"
    "eu-west-3-ubuntu" = "ami-0493936afbe820b28"
    "eu-west-3-suze"   = "ami-05c58114a34dbae09"
    "eu-west-3-redhat" = "ami-0460bf124812bebfa"
  }
  description = "Instances for region eu-west-3"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Minimal instance type"
}

variable "ingress-port" {
  type = list(number)
  default = [ 22, 80, 443 ]
  description = "List of ports allowed for Ingress trafic"
}

variable "egress-port" {
  type = list(number)
  default = [ 80, 443 ]
  description = "List of ports allowed for Egress trafic"
}