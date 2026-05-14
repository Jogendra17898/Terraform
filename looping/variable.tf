variable "rg_name" {  #list

  type        = list(string)
  description = "Asia ke desh"
}

variable "rg_location" {   #string

  type        = string
  description = "contry"
}  


variable "resource_groups" {   #map

  type = map(string)
  description = "RG Name and Location"
}