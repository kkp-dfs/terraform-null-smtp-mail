locals {
  command = "${var.mail_command} ${join(" ", var.to)}"
}

resource "null_resource" "default" {
  count = "${var.enabled == "true" ? 1 : 0}"

  triggers = {
    subject = "${var.subject}"
    body    = "${var.body}"
    command = "${local.command}"
  }

  provisioner "local-exec" {
    command = "${local.command}"

    environment = {
      EMAIL_FROM     = "${var.from}"
      EMAIL_SUBJECT  = "${var.subject}"
      EMAIL_BODY     = "${var.body}"
      EMAIL_PORT     = "${var.port}"
      EMAIL_HOST     = "${var.host}"
      EMAIL_USERNAME = "${var.username}"
      EMAIL_PASSWORD = "${var.password}"
    }

    on_failure = "fail"
  }
}
