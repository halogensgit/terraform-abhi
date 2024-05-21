resource "aws_lb_target_group" "tg" {
  name        = "${var.project_name}-tg"
  port        = var.port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    interval            = 300
    path                = var.health_check_path
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 60
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200-400"
  }

  target_health_state {
    enable_unhealthy_connection_termination = false
  }

  tags = {
    Name        = "${var.project_name}-tg"
    Environment = var.environment_name
  }
}
