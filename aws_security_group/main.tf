resource "aws_instance" "ec2-instance" {
  ami             = var.ami["eu-west-3-ami-1"]
  instance_type   = var.instance_type
  security_groups = [ aws_security_group.ec2-security-group.name ]
}

resource "aws_security_group" "ec2-security-group" {
  name = "ec2-security-group"
  description = "Public internet access for EC2"
  
  tags = {
    Name = "ec2-security-group"
    Role        = "public"
    Environment = "Test"
    ManagedBy   = "terraform"
  }
}

resource "aws_security_group_rule" "ec2-security-group-rule-in-https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2-security-group.id
}


resource "aws_security_group_rule" "ec2-security-group-rule-out-https" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2-security-group.id
}
