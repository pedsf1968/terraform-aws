resource "aws_instance" "webserver" {
  ami           = "ami-0493936afbe820b28"
  instance_type = "t2.micro"

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y",
      "systemctl enable nginx",
      "systemctl start nginx"    
    ]
  }

  provisioner "local-exec" {
    on_failure = fail
    when = create
    command = "echo Instance ${aws_instance.webserver.public_ip} Created! > /home/terraform/data/aws/instance_state.txt"
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo Instance ${aws_instance.webserver.public_ip} Destroyed! > /home/terraform/data/aws/instance_state.txt"
  }

  tags = {
    Name        = "webserver"
    Description = "An Nginx WebServer on Ubuntu"
  }

  connection {
    host = self.public_ip
    type = "ssh"
    user = "ubuntu"
    private_key = file("/home/terraform/.ssh/aws_ed25519")
  }

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