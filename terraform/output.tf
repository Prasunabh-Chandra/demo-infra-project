output "instance_public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = aws_instance.demo_ec2[*].public_ip
}

