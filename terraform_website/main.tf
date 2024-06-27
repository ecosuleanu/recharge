resource "random_id" "id" {
  byte_length = 2
  prefix      = "candidate-tech-lab-"
}

module "tech_lab" {
  source      = "./tech_lab"
  bucket_name = random_id.id.hex
  folder_dir  = "./downloads"
}

output "tech_lab_url" {
  description = "URL for the tech lab"
  value       = module.tech_lab.url
}
