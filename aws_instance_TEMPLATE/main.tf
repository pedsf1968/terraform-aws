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

resource "aws_security_group_rule" "public_in_https" {
  type              = "ingress"
  from_port         = each.value
  to_port           = each.value
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2-security-group.id

  for_each = var.ingress-port
}
 
resource "aws_security_group_rule" "public_out_https" {
  type              = "egress"
  from_port         = each.value
  to_port           = each.value
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2-security-group.id

  for_each = var.egress-port
}

resource "aws_eip" "ec2-eip" {
  instance = aws_instance.ec2-instance.id
}

output "EIP" {
  value = aws_eip.ec2-eip.public_ip
}

