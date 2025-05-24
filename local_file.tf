variable "name_content_2" {
    type = list(string)
    default = ["mango", "apple", "banana"]
}


resource "local_file" "example" {
    count = 3
    content = "Hello, World!-${count.index}"
    filename = "${path.module}/hello-${count.index}.txt"
}

resource "local_file" "example1" {
    count = length(var.name_content_2)
    content = "hello, world!-${var.name_content_2[count.index]}"
    filename = "${path.module}/hello-${var.name_content_2[count.index]}-${count.index}-1.txt"
}

resource "local_file" "example2" {
    for_each = toset(var.name_content_2)
    content = "hello, world!-${each.value}"
    filename = "${path.module}/hello-${each.value}.foreach.txt"
}

output "local_name"{
    value = local_file.example1.*.filename
}

output "instance_name"{
    value = aws_instance.demo_instance.*.public_ip
}
output "local_name_2"{
    value = [for name in var.name_content_2 : name if name == "mango"]
}

output "local_name_3"{
    value = [ for name in var.name_content_2 : name ]
}