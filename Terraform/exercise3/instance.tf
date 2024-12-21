resource "aws_instance" "dove-inst" {
  ami                    = var.AMIS[var.region]
  instance_type          = "t2.micro"
  availability_zone      = var.zone1
  key_name               = "dovekey"
  vpc_security_group_ids = ["sg-007331eacd3276139"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }
  connection {
    type        = "ssh"
    user        = var.user
    private_key = file("dovekey")
    host        = self.public_ip
  }
}

output "instance_public_ip" {
  value       = aws_instance.dove-inst.public_ip
  description = "The public IP of the EC2 instance"
}