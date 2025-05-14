resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  user_data = <-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y nginx
              echo "Hello from Terraform EC2" > /var/www/html/index.html
  EOF
}
# this would print "Hello from Terraform EC2" when we open the dns link
