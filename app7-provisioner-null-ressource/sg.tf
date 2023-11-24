 # create default vpc if one does not exit
resource "aws_default_vpc" "default_vpc" {
}
  # Create Web Security Group
resource "aws_security_group" "ssh" {
  name        = "week12-SG"
  description = "Allow ssh  inbound traffic"
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress {
      description = "ingress port "
      #from_port   = ingress.value
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "week12-SG"
  }
}


 



  
