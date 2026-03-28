resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}
