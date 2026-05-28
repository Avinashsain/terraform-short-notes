resource "local_file" "my_file" {
  for_each = toset(["automate.txt", "automate_2.txt"])

  content  = "Hello, Terraform!"
  filename = "${path.module}/${each.value}"
}