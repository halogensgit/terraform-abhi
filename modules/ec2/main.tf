resource "aws_instance" "jumper" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = true
  }

  iam_instance_profile = var.iam_instance_profile_name

  tags = {
    Name = "${var.project_name}-jumper"
  }

  lifecycle {
    create_before_destroy = true
  }
}
