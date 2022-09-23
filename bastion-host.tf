resource "aws_instance" "Bastion_Host" {
  ami           = data.aws_ami.bastion_host_ami.id
  instance_type = "t2.micro"

  #VPC
  vpc_security_group_ids = [aws_security_group.bastion_host_server_sg.id] #VPC
  #Keypair
  key_name = "talent_academy_lab"
  #Subnet_id
  subnet_id = aws_subnet.public.id

  tags = {
    Name = "Bastion_host"
  }

}

resource "aws_eip" "bastion_host_eip" {
  instance = aws_instance.Bastion_Host.id
  vpc      = true
  tags = {
    "Name" = "bastion_eip"
  }
}