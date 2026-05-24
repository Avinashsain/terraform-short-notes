resource "local_file" "my_file" {
  content  = "Hello, Terraform!"
  filename = "${path.module}/automate.txt"
}