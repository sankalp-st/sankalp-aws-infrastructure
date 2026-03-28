resource "aws_security_group" "sg" {
  description = "Allow Node App"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  ami           = var.ami
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install git -y
              curl -sL https://rpm.nodesource.com/setup_18.x | bash -
              yum install nodejs -y

              cd /home/ec2-user
              git clone ${var.repo_url} app
              cd app

              npm install
              npm install -g pm2
              pm2 start npm --name "app" -- start
              pm2 startup
              pm2 save
              EOF
}
