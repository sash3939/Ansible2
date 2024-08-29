###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default = "b1g0tptlsvgkbge2ul42"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default = "b1gc36q9v49llnddjkvr"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


variable "vm_web_image" {
  type        = string
  default     = "centos-7-oslogin"
  description = "VM image"
}

variable "vm_web_platform" {
  type        = string
  default     = "standard-v3"
  description = "Platform"
}


variable "base_name" {
  type        = string
  default     = "platform"
  description = "Base name"
}

variable "destination_web_name" {
  type        = string
  default     = "web"
  description = "Destination name"
}

#variable "vms_resources" {
#  type = map(any)
#}

#variable "metadata" {
#  type = map(string)
#}

#variable "test" {
#  type = list(map(list(string)))
#}
