resource "aws_instance" "this" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    delete_on_termination = true
  }

  disable_api_termination = true
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = var.instance_name
  }
  user_data = filebase64("${path.module}/user_data.sh")
}