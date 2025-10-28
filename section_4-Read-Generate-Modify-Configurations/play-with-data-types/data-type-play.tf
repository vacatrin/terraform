provider "aws" {
  region = "eu-central-1"
  profile = "tw-beach"
}

variable "my_map_var" {
  type = map
  default = {
    name = "Victor",
    city = "Berlin",
    age  = 34
  }
}

variable "my_list_var" {
  type = list(string)
  default = ["apple", "banana", "cherry"]
}

output "my_map_element" {
    value = var.my_map_var.name
}

output "my_list_element" {
  value = [var.my_list_var[0], var.my_list_var[2], var.my_map_var.age]
}
