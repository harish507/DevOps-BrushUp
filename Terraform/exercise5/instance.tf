resource "aws_instance" "dove-inst" {
  ami                    = var.AMIS[var.region]
  instance_type          = "t2.micro"
  availability_zone      = var.zone1
  key_name               = "dovekey"
  vpc_security_group_ids = [aws_security_group.dove-sg.id]
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

resource "aws_ebs_volume" "vol_4_dove" {
  availability_zone = var.zone1
  size              = 3
  tags = {
    Name = "extr-vol-4-dove"
  }
}

resource "aws_volume_attachment" "atch_vol_dove" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_dove.id
  instance_id = aws_instance.dove-inst.id
}
output "instance_public_ip" {
  value       = aws_instance.dove-inst.public_ip
  description = "The public IP of the EC2 instance"
}