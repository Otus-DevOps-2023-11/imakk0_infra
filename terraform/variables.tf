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

variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "image_id" {
  description = "Disk image"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "service_account_key_file" {
  type        = string
  description = "key.json"
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
