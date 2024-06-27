This solution outlines a Terraform module setup designed to take a list of image IDs and a folder name as inputs and perform the following tasks:

1. Fetches image metadata from `https://picsum.photos/`.
2. Creates an `index.html` file in the specified folder, displaying the images inline.
3. Outputs a map of objects containing image metadata.

Root Directory: 
- Contains the main Terraform configuration that invokes the tech_lab module.
- in the main.tf it calls the tech_lab module and provides it with the image_ids and folder_dir

Module Directory (tech_lab)
- Holds the actual implementation of the module logic including fetching image metadata and generating the HTML file.
- data source to fetch image_metadata - iterates over the image_ids and fetches their metadata from the API
- resource local_file index_html uses a template to generate index.html using the fetched metadata

- output.tf - creates an output map that organizez the image metadata by image ID
- variables.tf - defines variables for the module
