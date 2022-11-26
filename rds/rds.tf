resource "aws_db_instance" "drebase" {
  allocated_storage    = 10
  engine               = var.engine
  engine_version       = "8.0"
  instance_class       = var.instance_class
  db_name              = "mydb"
  username             = var.username
  password             = var.password
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.rds_sg]
  db_subnet_group_name = var.db_sngp
  
}

