data "aws_ami" "bastion_host_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "elasticsearch_ubuntu" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["Elasticsearch_AMI-*"]
  }
}

data "aws_ami" "kibana_ubuntu" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["Kibana_Ami-*"]
  }
}

data "aws_ami" "logstash_ubuntu" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["Logstash_Ami-*"]
  }
}

data "aws_ami" "filebeat_ubuntu" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["Filebeat_Ami-*"]
  }
}