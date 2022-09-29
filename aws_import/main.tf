resource "aws_instance" "webserver" {
  ami                    = "ami-0493936afbe820b28"
  availability_zone      = "eu-west-3c"
  instance_type          = "t2.micro"
  key_name               = "AWS-MyWebServer"
  vpc_security_group_ids = ["sg-0e053e68f3923a633"]

  tags = {
    Name = "webserver"
  }
}