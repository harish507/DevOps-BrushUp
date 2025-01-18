resource "aws_instance" "dove-inst" {
  ami                    = var.AMIS[var.region]["centos"]
  count                  = var.instance_count
  instance_type          = "t2.micro"
  availability_zone      = var.zone1
  key_name               = "dovekey"
  vpc_security_group_ids = [aws_security_group.dove-sg.id]
  tags = {
    Name    = "Web-Instance-${count.index + 1}"
    Project = "Web"
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

output "instance_public_ips" {
  value       = [for instance in aws_instance.dove-inst : instance.public_ip]
  description = "The public IPs of the EC2 instances"
}
