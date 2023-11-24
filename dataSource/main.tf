
resource "aws_instance" "server4" {
    ami = data.aws_ami.ami1.id
    key_name = data.aws_instance.datasourcedemo.key_name
    instance_type = "t3.small"
  
}