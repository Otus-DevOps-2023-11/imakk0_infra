variable "token" {
  description = "Service account token"
}

variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  default     = "ru-central1-a"
}

variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "fd8ehhhl0p67uearc16b"
}
variable "db_disk_image" {
  description = "Disk image for reddit app"
  default     = "fd8bimueg14j9p9o4oa4"
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
