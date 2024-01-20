variable "vpc_cidr" {
 type        = string
 description = "VPC CIDR"
 default     = "10.0.0.0/16"
}

variable "public_a_subnet_cidr" {
 type        = string
 description = "Public a Subnet CIDR"
 default     = "10.0.1.0/24"
}
 
variable "public_b_subnet_cidr" {
 type        = string
 description = "Public b Subnet CIDR"
 default     = "10.0.2.0/24"
}

variable "private_a_subnet_cidr" {
 type        = string
 description = "Private a Subnet CIDR"
 default     = "10.0.4.0/24"
}

variable "private_b_subnet_cidr" {
 type        = string
 description = "Private b Subnet CIDR"
 default     = "10.0.5.0/24"
}