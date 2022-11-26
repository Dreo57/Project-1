variable "cidr_block" {
    default = ["190.0.1.0/24","190.0.2.0/24", "190.0.3.0/24", "190.0.4.0/24"]
      
}

variable "availability_zone" {
    default = ["us-east-1a", "us-east-1a","us-east-1b", "us-east-1b"]
    # default = ["us-west-2a", "us-west-2a","us-west-2b", "us-west-2b"]  
}

variable "sn_name_tag" {
  default = ["publicsn", "prvtsn","publicsn1", "prvtsn1"]
}
variable "route-table-tag" {
  default = ["drenet-pubrt", "drenet-prvtrt"]
  
}
