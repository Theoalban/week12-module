resource "aws_iam_group" "group1" {
  name = "DevOps"
}


resource "aws_instance" "name" {
  ami           = data.aws_ami.ami1.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ec2_key.key_name

  depends_on = [aws_key_pair.ec2_key, aws_iam_group.group1]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = "week12b.pem"
    host        = self.public_ip
  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo hello"
  }
  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo yum update -y",
      "mkdir theo",
      "pwd",
      "nproc",
    ]
  }
  provisioner "file" {
    when = destroy
    source      = "week12b.pem"
    destination = "/tmp"
  }

}



