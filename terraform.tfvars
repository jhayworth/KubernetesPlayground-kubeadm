shared_credentials_file             = "~/.aws/credentials"
region                              = "us-west-2"

# == AWS related
ami                                 = "ami-04a32162efe87cb4c"             # Ubuntu 22.04
private_ip                          = ""  //If production IP is blank, allow dynamic selection.
instance_type                       = "t3.micro"
subnet_id                           = "subnet-08efc33474ed08205" #us-west-2b
vpc_security_group_ids              = ["sg-065167574d8e37044"]
key_name                            = "AWS_DevOps_0011"
connection_private_key_file_path    = "~/.ssh/AWS_DevOps_0011.pem"
devops_tech                         = "Joshua Hayworth"
devops_tech_email                   = "devops@kratosdefense.com"
