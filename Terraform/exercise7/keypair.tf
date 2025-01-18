resource "aws_key_pair" "dovekey" {
  key_name   = "dovekey"
  public_key = file("dovekey.pub")
}