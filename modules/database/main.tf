# RDS Instance
resource "aws_db_instance" "blog_db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.id
  vpc_security_group_ids = [var.private_sg_id]
  publicly_accessible  = false
}

# RDS Subnet Group
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group-178648"
  subnet_ids = var.private_subnets
  tags = {
    Name = "RDS Subnet Group"
  }
}

# S3 Bucket
resource "aws_s3_bucket" "blog_assets" {
  bucket = "blog-assets-123456788776"
  tags = {
    Name = "Blog Assets Bucket"
  }
}

resource "random_string" "unique_id" {
  length  = 8
  special = false
}
