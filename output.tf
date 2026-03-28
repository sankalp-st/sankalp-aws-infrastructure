output "app_url" {
  value = "http://${aws_instance.app.public_ip}:3000"
}

output "public_ip" {
  value = aws_instance.app.public_ip
}