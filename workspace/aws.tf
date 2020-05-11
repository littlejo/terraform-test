data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

locals {
     env = terraform.workspace
}

variable count_example {
   type = map
   default = {
       default: 1
       test: 1
       preprod: 2
       prod: 3
   }
}

variable instance_type_example {
   type = map
   default = {
       default: "t2.micro"
       test: "t2.micro"
       preprod: "t2.medium"
       prod: "t3.large"
   }
}


resource "aws_instance" "example" {
  ami = data.aws_ami.app_ami.id
  count = var.count_example[local.env]
  instance_type = var.instance_type_example[local.env]
}

