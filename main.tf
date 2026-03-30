data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "sg" {
  description = "Allow Node App"

  vpc_id = data.aws_vpc.default.id  

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
              set -e
              
              # Update system packages
              apt update -y
              apt upgrade -y
              
              # Install dependencies
              apt install -y git curl wget
              
              # Install Node.js 18
              curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
              apt install -y nodejs
              
              # Navigate to home directory and clone repository
              cd /home/ubuntu
              git clone ${var.repo_url} app
              cd app
              
              # Install dependencies and start app
              npm install
              npm install -g pm2
              
              # Start Node.js app with PM2
              pm2 start npm --name "app" -- start
              pm2 startup systemd -u ubuntu --hp /home/ubuntu
              pm2 save
              
              # Enable PM2 autostart
              sudo systemctl enable pm2-ubuntu
              
              echo "Deployment completed successfully"
              EOF
}
