# Terraform website sample

Create a terraform module that will:

* Take as input:
  * A bucket name
  * A source folder name

* Perform the following actions:
  * Create a Google Cloud Storage bucket capable of hosting a static website
    * HTTP is sufficient. You do not need to configure HTTPS support
  * Upload the files from the source folder to the bucket
  * Utilize the 404.html file in the source folder
  * Create an index.html in the bucket that looks like:

    ```text
    These are the files available for downloading

    * file 1
    * file 2
    ...
    * file n
    ```

    * Note: this list should _not_ include the 404.html file

* Return as output values:
  * The url of the website
    * Note: because DNS isn't available for creating a "friendly" name, this can be the `storage.googleapis.com` based url

## Tying it all together

After running `terraform apply`, anyone should be able to:

1. Open the website in a browser
2. Get a list of files
3. Attempt to go to a non-existent URL and get a customized 404 error page

You may also run the included validation tool to further test your work. You can run the tool like so:

```shell
# Run tests
./validate.sh
```
