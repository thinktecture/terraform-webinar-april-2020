variable "location" {
  type        = string
  description = "Azure Location where Resources will be generated"
  default     = "westeurope"
}


variable "environment_name" {
  type        = string
  description = "Environment Name"
  default     = "development"
}

variable "tags" {
  type        = map
  default     = {}
  description = "custom tags for all resources"
}

variable "asp_size" {
  type    = string
  default = "S1"
}
