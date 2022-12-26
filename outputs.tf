output "vpc_id" {
  value       = aws_vpc.telecom_vpc.id
  description = "VPC id"

  sensitive = false
}

