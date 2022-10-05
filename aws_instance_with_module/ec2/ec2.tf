variable "ec2-name" {
  description = "Name of the EC2 instance"
  type = string
  default = "Name from resource"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0ddab716196087271"
  instance_type = "t2.micro"

  tags = {
    Name = var.ec2-name
  }
}

output "instance-id" {
  value = aws_instance.ec2.id
}