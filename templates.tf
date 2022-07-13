data "template_file" "chef-config" {
    template =  "${file("${path.module}/templates/config.rb.tpl")}"
    vars = {
        chef_server_url     = "${var.chef_server_url}"
        chef_node_name      = "${var.dns_host_record_name}"
    }
}