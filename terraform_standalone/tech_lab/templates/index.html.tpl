<!DOCTYPE html>
<html>
<head>
  <title>Image Gallery</title>
</head>
<body>
  <h1>These are your images, sorted by ID number</h1>
  %{ for image in images ~}
  <div>
    <img src="${jsondecode(image).download_url}" alt="Image ${jsondecode(image).id}">
    <p>Author: ${jsondecode(image).author}</p>
  </div>
  %{ endfor ~}
</body>
</html>
