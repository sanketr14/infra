provider "aws" {
  region = "ca-central-1"
}

resource "aws_instance" "web-server" {
  ami          = "ami-0394b19441f2a0121"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
user_data = <<-EOF
              #!/bin/bash
              echo "Toh Kaise hai aap log !!" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
tags = {
    Name = "terraform-web-server"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-ws-instance"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
