resource "aws_security_group" "dynamicsg" {
  name        = var.name
  description = var.description

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = [var.cidr_blocks]
    }
  }
}
