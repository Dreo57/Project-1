variable "cidr_block_pub" {
    default = ["190.0.1.0/24","190.0.3.0/24"]
      
}

variable "cidr_block_prvt" {
    default = ["190.0.2.0/24","190.0.4.0/24"]
      
}


variable "availability_zone_pub" {
    default = ["us-east-1a","us-east-1b"]
    # default = ["us-west-2a", "us-west-2a","us-west-2b", "us-west-2b"]  
}

variable "availability_zone_prvt" {
    default = ["us-east-1a","us-east-1b"]
    # default = ["us-west-2a", "us-west-2a","us-west-2b", "us-west-2b"]  
}


variable "sn_name_tag_pub" {
  default = ["publicsn", "publicsn1"]
}

variable "sn_name_tag_prvt" {
  default = ["prvtsn" , "prvtsn1"]
}


variable "route-table-tag" {
  default = ["drenet-pubrt", "drenet-prvtrt", "drenet-prvtrt1"]
  
}

variable "nat-gateway-tag" {
  default = ["drenet-pubrt", "drenet-prvtrt"]
  
}

