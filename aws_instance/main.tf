resource "aws_instance" "webserver" {
  ami           = "ami-0493936afbe820b28"
  instance_type = "t2.micro"

  tags = {
    Name        = "webserver"
    Description = "An Nginx WebServer on Ubuntu"
  }

  user_data = <<-EOF
  #!/bin/bash
  sudo apt update
  sudo apt install nginx -y
  systemctl enable nginx
  systemctl start nginx
EOF

  key_name               = aws_key_pair.aws_ed25519.id
  vpc_security_group_ids = [aws_security_group.webserver-ssh-access.id]
}

resource "aws_key_pair" "aws_ed25519" {
  public_key = file("/home/terraform/.ssh/aws_ed25519.pub")
}

resource "aws_security_group" "webserver-ssh-access" {
  name        = "ssh-access"
  description = "Allow SSH access from Internet"

  ingress {
    description = "SSH connection"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    description = "http connexion"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}

output "public-ip" {
  value = aws_instance.webserver.public_ip
}
