output "public_ip" {
    value = aws_instance.webserver.public_ip
}
output "tg_id" {
    value = aws_instance.webserver.tags
}