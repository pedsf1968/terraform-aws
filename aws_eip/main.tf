resource "aws_instance" "ec2" {
  ami           = var.ami["eu-west-3-ami-1"]
  instance_type = var.instance_type
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.ec2.id
}

output "EIP" {
  value = aws_eip.elasticip.public_ip
}