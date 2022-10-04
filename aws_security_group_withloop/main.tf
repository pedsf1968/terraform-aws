resource "aws_instance" "ec2-instance" {
  ami             = var.ami["eu-west-3-ami"]
  instance_type   = var.instance_type
  security_groups = [ aws_security_group.ec2-security-group.name ]
}

resource "aws_security_group" "ec2-security-group" {
  name = "ec2-security-group"
  description = "Public internet access for EC2"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress-port
    content {
      description = "Ingress trafic by port : ${port.value}"
      from_port         = port.value
      to_port           = port.value
      protocol          = "tcp"
      cidr_blocks       = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress-port
    content {
      description = "Egress trafic by port : ${port.value}"
      from_port         = port.value
      to_port           = port.value
      protocol          = "tcp"
      cidr_blocks       = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "ec2-security-group"
    Role        = "public"
    Environment = "Test"
    ManagedBy   = "terraform"
  }
}

