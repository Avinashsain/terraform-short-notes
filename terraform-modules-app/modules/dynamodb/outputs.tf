output "aws_dynamodb_table" {
  value = aws_dynamodb_table.basic-dynamodb-table[*].name
}