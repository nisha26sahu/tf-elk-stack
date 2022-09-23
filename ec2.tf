resource "aws_instance" "elasticsearch_server_instance" {
  ami           = data.aws_ami.elasticsearch_ubuntu.id
  instance_type = "t2.large"

  vpc_security_group_ids = [aws_security_group.elasticsearch_sg.id]
  key_name = "talent_academy_lab"

  subnet_id = aws_subnet.private_a.id

  tags = {
    Name = "Elasticsearch_server"
  }
}

resource "aws_instance" "kibana_server_instance" {
  ami           = data.aws_ami.kibana_ubuntu.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.kibana_sg.id]
  key_name = "talent_academy_lab"

  subnet_id = aws_subnet.public.id

  tags = {
    Name = "Kibana_server"
  }
}

resource "aws_instance" "logstash_server_instance" {
  ami           = data.aws_ami.logstash_ubuntu.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.logstash_sg.id]
  key_name = "talent_academy_lab"

  subnet_id = aws_subnet.private_a.id

  tags = {
    Name = "Logstash_server"
  }
}

resource "aws_instance" "filebeat_server_instance" {
  ami           = data.aws_ami.filebeat_ubuntu.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.filebeat_sg.id]
  key_name = "talent_academy_lab"

  subnet_id = aws_subnet.private_a.id

  tags = {
    Name = "Filebeat_server"
  }
}

resource "aws_instance" "filebeat_server1_instance" {
  ami           = data.aws_ami.filebeat_ubuntu.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.filebeat_sg.id]
  key_name = "talent_academy_lab"

  subnet_id = aws_subnet.private_b.id

  tags = {
    Name = "Filebeat_server1"
  }
}

resource "aws_instance" "filebeat_server2_instance" {
  ami           = data.aws_ami.filebeat_ubuntu.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.filebeat_sg.id]
  key_name = "talent_academy_lab"

  subnet_id = aws_subnet.private_c.id

  tags = {
    Name = "Filebeat_server2"
  }
}



# resource "aws_eip" "ansible_server_eip" {
#   instance = aws_instance.elasticsearch_server.id
#   vpc      = true
# }