output "instance_private_ip" {
  value = aws_instance.legacy.private_ip
}

output "instance_public_ip" {
  value = aws_instance.legacy.public_ip
}

output "instance_public_dns" {
  value = aws_instance.legacy.public_dns
}
