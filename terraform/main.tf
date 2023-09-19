provider "aws" {
  region = "us-west-2"  
}

resource "aws_instance" "legacy" {
  ami           = "ami-0c65adc9a5c1b5d7c" 
  instance_type = "t2.micro"
  key_name      = "ryuheimac"
  vpc_security_group_ids = [ aws_security_group.legacy.id ]

  tags = {
    Name = "legacy"
  }
}

resource "aws_security_group" "legacy" {
  name_prefix = "legacy-"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Be cautious with this, limit the IP range if necessary
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Be cautious with this, limit the IP range if necessary
  }
}

