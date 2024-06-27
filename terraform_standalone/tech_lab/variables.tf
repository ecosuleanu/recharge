variable "folder_dir" {
  description = "destination folder"
  type        = string
}

variable "image_ids" {
  description = "List of image IDs to retrieve"
  type        = list(number)
}
