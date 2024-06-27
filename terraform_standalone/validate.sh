#!/usr/bin/env bash

terraform init
terraform validate
terraform apply -auto-approve

if [ -d ./downloads ]; then
    echo "[OK] Downloads directory exists"
else
    echo "[NOT OK] Couldn't find Downloads directory"
fi

if [ -f ./downloads/index.html ]; then
    echo "[OK] index file exists"
else
    echo "[NOT OK] Couldn't find index file"
fi