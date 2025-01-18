variable "region" {
  default = "us-east-1"
}

variable "zone1" {
  default = "us-east-1a"
}

variable "instance_count" {
  default = 3
}


variable "AMIS" {
  type = map(map(any))
  default = {
    us-east-2 = {
      amazon_linux = "ami-03657b56516ab7912"
      ubuntu       = "ami-0d5eff06f840b45e9"
      centos       = "ami-064ac61091898694e"
    }
    us-east-1 = {
      amazon_linux = "ami-0947d2ba12ee1ff75"
      ubuntu       = "ami-005fc0f236362e99f"
      centos       = "ami-0df2a11dd1fe1f8e3"
    }
  }
}

variable "user" {
  default = "ec2-user"
}