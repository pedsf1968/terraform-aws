resource "aws_instance" "webserver" {
  ami                    = var.ami
  availability_zone      = var.availability_zone
  instance_type          = var.instance_type
  key_name               = var.key_name
}