output "instance_ip" {
    value=aws_instance.server_cesar.*.public_ip
}
