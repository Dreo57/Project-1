output "latest_version" {
  value = aws_autoscaling_group.dreo.id
}

output "launch_temp" {
  value = aws_launch_template.dre_temp.id
}