resource "aws_instance" "webserver" {
  ami           = data.aws_ami.amzon_linux.id
  instance_type = var.web_type

  tags = {
    Name = "WebServer"
  }

  security_groups = [aws_security_group.webserver_security_group.name]

  user_data = <<-EOF
        #!/bin/bash
        yum update -y
        yum install -y httpd
        systemctl start httpd
        systemctl enable httpd
        echo "Hello, World" > /var/www/html/index.html
    EOF
}
