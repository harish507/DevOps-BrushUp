resource "aws_instance" "dove-inst" {
  ami                    = var.AMIS[var.region]
  instance_type          = "t2.micro"
  availability_zone      = var.zone1
  key_name               = "game"
  vpc_security_group_ids = ["sg-007331eacd3276139"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
}

output "instance_public_ip" {
  value       = aws_instance.dove-inst.public_ip
  description = "The public IP of the EC2 instance"
}