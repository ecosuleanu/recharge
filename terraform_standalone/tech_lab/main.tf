terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "~>2.0"
    }
  }
}

data "http" "image_metadata" {
  for_each = {for id in var.image_ids : id => id}

  url = "https://picsum.photos/id/${each.key}/info"
}

resource "local_file" "index_html" {
  content = templatefile("${path.module}/templates/index.html.tpl", {
    images = [for id in var.image_ids : data.http.image_metadata[id].response_body]
  })

  filename = "${var.folder_dir}/index.html"
}

 