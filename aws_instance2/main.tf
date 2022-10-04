resource "aws_instance" "ec2-ami" {
  ami           = var.ami["eu-west-3-ami-1"]
  instance_type = var.instance_type
}