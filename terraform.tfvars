shared_credentials_file             = "~/.aws/credentials"
region                              = "us-west-2"

# == AWS related
tool_name                           = "example"
instance_name                       = "ec2-uw2-2a-example-server-name"
ami                                 = "ami-3ecc8f46"             # CentOS 7
private_ip                          = ""  //If production IP is blank, allow dynamic selection.
instance_type                       = "t3.micro"
subnet_id                           = "subnet-08efc33474ed08205" #us-west-2b
vpc_security_group_ids              = ["sg-065167574d8e37044"]

# See this wiki page for more details - https://wiki.devops.kratosdefense.com/display/CYBEROPS/ParkMyCloud+Tags
uptime_requirement                  = "Pacific-Work"

key_name                            = "AWS_DevOps_0011"
connection_private_key_file_path    = "~/.ssh/AWS_DevOps_0011.pem"
devops_tech                         = "Joshua Hayworth"
devops_tech_email                   = "devops@kratosdefense.com"

dns_hosted_zone_id                  = "Z23HC9WI8FOZFM"
dns_host_record_name                = "example-server.devops.kratosdefense.com"