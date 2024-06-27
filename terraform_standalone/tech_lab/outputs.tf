output "images" {
  description = "A map of image_ids and their metadata"
  value       = {for id in var.image_ids : id => jsondecode(data.http.image_metadata[id].response_body)}
#Loops over each element id in the list variable var.image.ids
}

