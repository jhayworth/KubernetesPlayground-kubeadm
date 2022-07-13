provider "aws" {
    shared_credentials_file = var.shared_credentials_file
    region                  = var.region

    default_tags {
        tags = {
            DevOps = "Test"
            DevOpsTech = var.devops_tech
            Cleanup = "Yes"
            Terraform = "Yes"

            # Default Tags for InfoOps
            OWNER = var.devops_tech
            EMAIL = var.devops_tech_email
	}
    }
}

resource "aws_instance" "example" {
    ami                     = var.ami
    private_ip              = var.private_ip
    instance_type           = var.instance_type
    subnet_id               = var.subnet_id
    vpc_security_group_ids  = var.vpc_security_group_ids
    key_name                = var.key_name
    user_data               = file("scripts/user-data.sh")

    root_block_device {
        delete_on_termination = "true"
        volume_size           = "100"
        volume_type           = "gp2"
    }

    tags = {
        Name = var.tool_name
        HOURS = var.uptime_requirement
    }

    connection {
        host              = aws_instance.example.private_ip
        user              = "centos"
        private_key       = file(var.connection_private_key_file_path)
        timeout           = "15m"
    }

    provisioner "local-exec" { command = "echo id : ${aws_instance.example.id} >> ${aws_instance.example.id}_id.txt" }
    provisioner "local-exec" { command = "echo private_ip : ${aws_instance.example.private_ip} >> ${aws_instance.example.id}_id.txt" }

    provisioner "file" {
        source = "scripts/downloadartifacts.sh"
        destination = "/tmp/downloadartifacts.sh"
    }

    provisioner "file" {
        content     = data.template_file.chef-config.rendered
        destination = "/tmp/config.rb"
    }

    provisioner "file" {
        source = "secrets/devops-validator.pem"
        destination = "/tmp/devops-validator.pem"
    }

    provisioner "remote-exec" {
        inline = [
              "sudo chmod +x /tmp/downloadartifacts.sh",
              "sudo /tmp/downloadartifacts.sh"
        ]
    }

    provisioner "local-exec" {
        command = "knife bootstrap ${aws_instance.example.private_ip} -N ${var.dns_host_record_name} -x centos --sudo >> output/${aws_instance.example.id}_cheflog.txt"
    }
}

resource "aws_route53_record" "example_dns" {
  zone_id = var.dns_hosted_zone_id
  name    = var.dns_host_record_name
  type    = "A"
  ttl     = "300"
  records = [aws_instance.example.private_ip]
}