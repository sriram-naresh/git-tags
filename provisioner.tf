
#https://jhooq.com/terraform-provisioner/

variable "provisioner_status" {
    description = "value of the provisioner status"
    type       = bool
    default = false
}
resource "null_resource" "provision_enable_check"{
    count = var.provisioner_status ? 1 : 0
    provisioner "file" {
        #content = "Hello, World!-${var.name_content_2[count.index]}"
        source     = "${path.module}/hello-${count.index}.txt"
        destination = "/tmp/hello-${count.index}.txt"
    connection {
        type   = "ssh"
        user = "ec2-user"
        private_key = file("../../practice-instance-kpair.pem")
        host = aws_instance.demo_instance[count.index].public_ip
    }
    }
    provisioner "local-exec" {

        command = "echo Hello, World! > hello-${count.index}.txt"
        working_dir = "${path.module}"
        environment = {
            MY_ENV_VAR = "Hello, World!"
        }
        interpreter = ["bash", "-c"]
    }
    /*provisioner "remote-exec" {
        script = "${path.module}/scripts/hello.sh"
        inline = [
            "echo Hello, World! > /tmp/hello-${count.index}.txt",
            "sudo yum update -y",
            "sudo yum install -y httpd",
            "sudo systemctl start httpd",
            "sudo systemctl enable httpd"
        ]
        #command = "echo Hello, World! > /tmp/hello-${count.index}.txt"
        connection {
            type   = "ssh"
            user = "ec2-user"
            private_key = file("../../practice-instance-kpair.pem")
            host = aws_instance.demo_instance[count.index].public_ip
        }
    }*/
   }