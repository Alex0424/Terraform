resource "aws_instance" "web" {
  ami                         = var.amiID[var.region]
  instance_type               = "t3.micro"
  key_name                    = "dove-key"
  vpc_security_group_ids      = [aws_security_group.dove-sg.id]
  availability_zone           = var.zone1
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.my_subnet.id

  tags = {
    Name    = "Dove-web"
    Project = "Dove"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  connection {
    type        = "ssh"
    user        = var.webuser
    private_key = file("dovekey")
    host        = self.public_ip
    timeout     = "2m"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

}

resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "172.16.10.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# --- Route Table Association ---
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web.id
  state       = "running"
}

output "WebPublicIP" {
  description = "AMI ID of Ubuntu instance"
  value       = aws_instance.web.public_ip
}

output "WebPrivateIP" {
  description = "AMI ID of Ubuntu instance"
  value       = aws_instance.web.private_ip
}
