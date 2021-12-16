output "subject" {
  description = "Rendered subject of the email"
  value       = "${var.subject}"
}

output "body" {
  description = "Rendered body of the email"
  value       = "${var.body}"
}
