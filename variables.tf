variable "shared_credentials_file" {
    type = string
    description = "Shared Credentials File"
    default = "~/.aws/credentials"
}

variable "region" {
    type = string
    description = "region to use for the instance"
    default = "us-west-2"
}

variable "tool_name" {
    type = string
    description = "name for the instance"
    default = "example"
}

variable "instance_name" {
    type = string
    description = "Host name for the instance that will be created"
    default = "ec2-uw2-2a-example-server-name"
}

variable "ami" {
    type = string
    description = "Amazon Machine ID"
    default = "ami-3ecc8f46"
}

variable "private_ip" {
    type = string
    description = "IP for the Artifactory instance"
    default = ""
}

variable "instance_type" {
    type = string
    description = "type (size) for the instance"
    default = "m5.xlarge"
}

variable "subnet_id" {
    type = string
    default = "subnet-08efc33474ed08205"
    description = "the subnet id for DevOps"
}

variable vpc_security_group_ids {
    type = list(string)
    default = ["sg-02175331263432e7e", "sg-031bb5171c23e4e30"]
    description = "Subnets"
}

variable "key_name" {
    type = string
    description = "The name of pem certificate to use for the instance"
    default= "AWS_DevOps_0011"
}

variable "connection_private_key_file_path" {
    type = string
    description = "Certificate File Path for Connection via private key"
    default = "~/.ssh/AWS_DevOps_0011.pem"
}

variable "devops_tech" {
    type = string
    description = "The DevOps Technician primarily responsible for creating this instance. Used for tagging."
    default = "Put your name here"
}

variable "devops_tech_email" {
    type = string
    description = "The DevOps Technician primarily responsible for creating this instance. Used for tagging."
    default = "devops@kratosdefense.com"
}












# === CANDIDATES FOR DELETION ===

# CentOS Linux 7 x86_64 HVM EBS ENA 1805_01-b7ee8a69-ee97-4a49-9e68-afaee216db2e-ami-77ec9308.4 (ami-3ecc8f46)
# ami-3ecc8f46
# Todo, make this region friendly?
# ami = "${lookup(var.amicentos, var.region, "ami-3ecc8f46")}"

variable "aws_route53_record_name" {
    description = "aws_route53_record name"
    default = "name.devops.kratosdefense.com"
}

variable "db_allocated_storage" {
    default = "75"
    description = "Amount of allocated storage for DB"
}

variable "db_identifier" {
  description = "ID for DB"
  default = "rds-db-pg-0925-b" 
}

variable "db_name" {
  description = "Name for DB"
  default = "devopsdb"
}

#jira_db_username

variable "db_user" {
  description = "DB user"
  default = "devopsuser"
}

variable "db_password" {
  description = "DB password"
  default = "jellyfish"
}

variable "db_paramter_group_name" {
  description = "Name for DB"
  default = "rds-db-pg-0925-b" 
}

variable "ec2_name" {
  description = "name for the ec2 instance"
  default = "ec2"
}

variable "parameter_family" {
    default = "default"
    description = "parameter group family for db"
}

variable "prefix" {
   default = "prefix"
   description = "Prefix used for staged DevOps services"
}

variable "profile" {
  description = "Profile for credentials"
  default = "devops"
}

variable "rds_name" {
    default = "devops"
    description = "Default name for RDS instance"
}


variable "role_arn" {
  description = "Role Amazon Resource Name ARN"
  default = "arn:aws:iam::124375825897:role/OrganizationAccountAccessRole"
}


#access_key = "AKIAI374G...." #Taylor's personal
#secret_key = "XIXNnJhy1suRgysKjJ....."  #Taylor's personal


variable "ssl_certificate_arn" {
  description = "Wildcard cert"
  #default = "arn:aws:acm:us-west-2:124375825897:certificate/3ba13713-2539-49b2-bb4c-167e475c6034"  # *.kratosdefense.com 
  default ="arn:aws:acm:us-west-2:124375825897:certificate/29994f1d-ef31-407b-911a-176ad94aabc7"  # *.devops.kratosdefense.com 
}






