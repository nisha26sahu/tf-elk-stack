#Security group for elasticsearch
resource "aws_security_group" "elasticsearch_sg" {
  name        = "elasticsearch-sg"
  description = "Allow connection for elasticsearch security group."
  vpc_id      = aws_vpc.vpc_elk.id

  ingress {
    description = "Allow port 22 for ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.bastion_host_server_sg.id]
  }

  ingress {
    description = "Allow port 9200 for elasticsearch"
    from_port   = 9200
    to_port     = 9200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "elasticsearch-sg"
  }
}

#Security group for logstash
resource "aws_security_group" "logstash_sg" {
  name        = "logstash-sg"
  description = "Allow connection for logstash security group."
  vpc_id      = aws_vpc.vpc_elk.id

  ingress {
    description = "Allow port 22 for ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow port 5044 for logstash"
    from_port   = 5044
    to_port     = 5044
    protocol    = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.bastion_host_server_sg.id, aws_security_group.elasticsearch_sg.id, aws_security_group.filebeat_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "logstash-sg"
  }
}
#Security group for Kibana
resource "aws_security_group" "kibana_sg" {
  name        = "kibana-sg"
  description = "Allow connection for kibana security group."
  vpc_id      = aws_vpc.vpc_elk.id

  ingress {
    description = "Allow port 22 for ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.bastion_host_server_sg.id, aws_security_group.elasticsearch_sg.id]
  }

  ingress {
    description = "Allow port 5601 for kibana security group"
    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "kibana-sg"
  }
}

#Security group of filebeat
resource "aws_security_group" "filebeat_sg" {
  name        = "filebeat-sg"
  description = "Allow connection for filebeat security group."
  vpc_id      = aws_vpc.vpc_elk.id

  ingress {
    description = "Allow port 22 for ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #security_groups = [aws_security_group.bastion_host_server_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "filebeat-sg"
  }
}

#Security group for Bastio Host server
resource "aws_security_group" "bastion_host_server_sg" {
  name        = "bastion-host-server"
  description = "Allow connection for bastion host server."
  vpc_id      = aws_vpc.vpc_elk.id

  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-host-server"
  }
}