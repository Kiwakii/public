terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "gh-actions-demo-1"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIATSTURBP7I6S3YCMO"
  secret_key = "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"
}

resource "aws_s3_bucket_object" "objtf" {
  bucket = "experiment-terraform"
  key    = "aws_s3_bucket_object.objtf"
  source = "C:/Users/brigh/OneDrive/Documents/Projects/Dow_Jones_AWS/terraform"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("C:/Users/brigh/OneDrive/Documents/Projects/Dow_Jones_AWS/terraform")
}

resource "random_pet" "sg" {}

# resource "aws_instance" "web" {
#   ami                    = "ami-830c94e3"
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.web-sg.id]

#   user_data = <<-EOF
#               #!/bin/bash
#               echo "Hello, World" > index.html
#               nohup busybox httpd -f -p 8080 &
#               EOF
# }

# resource "aws_security_group" "web-sg" {
#   name = "${random_pet.sg.id}-sg"
#   ingress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# output "web-address" {
#   value = "${aws_instance.web.public_dns}:8080"
# }
