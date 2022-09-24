# require création of remote state backend on AWS with folder ../aws_remote_state_backend

resource "local_file" "pet" {
  filename = "/home/terraform/data/aws/aws_use_of_remote_state/pets.txt"
  content = "I love pets!"
}