#!/usr/bin/env bash

validate_terraform () {
    terraform init
    terraform validate
    terraform apply -auto-approve
}

validate_url () {
    local url=$1

    # shellcheck disable=SC2034  # Global value
    sha1sum=$(curl -s "$url" | openssl dgst -sha1)
    local res=$?

    if [ $res != 0 ]; then
        echo "[NOT OK] The curl command against $url failed with: $res"
    else
        echo "[OK] Curl succeeded for $url"
    fi
}

validate_terraform

url=$(terraform output url)

validate_url "$url"
validate_url "${url}/page_that_does_not_exist"
if [ "$sha1sum" != "5455f8420c09b2effd39a040c3d6443020389f42" ]; then
    echo "[NOT OK] The website didn't return the expected error page"
else
    echo "[OK] The website returned the expected error page"
fi
