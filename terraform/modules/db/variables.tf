variable "zone" {
  description = "Zone"
  default     = "ru-central1-a"
}

variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "subnet_id" {
  description = "Subnet"
}

variable "private_key_path" {
  type        = string
  description = "Path to the private key used for ssh access"
  default     = "~/.ssh/yc-user"
}

variable "app_numbers" {
  type        = string
  description = "Numbers of each apps"
  default     = 1
}

variable db_disk_image {
description = "Disk image for reddit db"
}
