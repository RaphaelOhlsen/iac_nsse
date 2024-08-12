resource "aws_security_group" "worker" {
  name        = var.ec2_resources.worker_security_group
  description = "Managing ports for worker nodes"
  vpc_id      = data.aws_vpc.this.id

  egress = [{
    description      = "Allow all traffic out"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }]

  tags = merge({ Name = var.ec2_resources.worker_security_group }, var.tags)
}
