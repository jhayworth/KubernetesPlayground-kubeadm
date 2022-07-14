variable "shared_credential_files" {
    type = list(string)
    description = "Shared Credentials File"
    default = ["~/.aws/credentials"]
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

variable "ami" {
    type = string
    description = "Amazon Machine ID"
    default = "ami-3ecc8f46"
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

variable "kubernetes_primary_name" {
    type = string
    description = "The NAME tag for the primary kubernetes node - control"
}

variable "kubernetes_secondary_name" {
    type = string
    description = "The NAME tag for the secondary kubernetes node - worker"
}