module "tech_lab" {
  source     = "./tech_lab"
  folder_dir = "./downloads"
  image_ids = [
    1022,
    1023,
    103,
    1060,
    133
  ]
}
