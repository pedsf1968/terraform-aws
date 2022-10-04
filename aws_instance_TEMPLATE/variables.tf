variable "ami" {
  type = map(any)
  default = {
    "eu-west-3-ami-1"    = "ami-0ddab716196087271"
    "eu-west-3-ami-2"    = "ami-0eeba548a1a39b254"
    "eu-west-3-ubuntu-1" = "ami-0493936afbe820b28"
    "eu-west-3-ubuntu-2" = "ami-064736ff8301af3ee"
    "eu-west-3-suze-1"   = "ami-05c58114a34dbae09"
    "eu-west-3-redhat-1" = "ami-0460bf124812bebfa"
    "eu-west-3-redhat-2" = "ami-0c4dbc994a301913f"
  }
  description = "Instances for region eu-west-3"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Minimal instance type"
}

variable "ingress-port" {
  type = set(string)
  default = [ "22", "80", "443" ]
  description = "List of ports allowed for Ingress trafic"
}

variable "egress-port" {
  type = set(string)
  default = [ "80", "443" ]
  description = "List of ports allowed for Egress trafic"
}