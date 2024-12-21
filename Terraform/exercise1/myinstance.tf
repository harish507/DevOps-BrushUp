provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "game" {
  ami           = "ami-0e2c8caa4b6378d8c" # Replace with your AMI ID
  instance_type = "t2.micro"              # Specify the instance type

  vpc_security_group_ids = ["sg-007331eacd3276139"]

  # Optional: Add key pair for SSH access
  key_name = "game" # Replace with your existing key pair name

  # Optional: Add tags to the instance
  tags = {
    Name = "Game_Instance"
  }
}

# Output the public IP of the EC2 instance
output "instance_public_ip" {
  value       = aws_instance.game.public_ip
  description = "The public IP of the EC2 instance"
}
