#!/bin/bash
# Script for getting or renewing a free Let's Encrypt certificate

mkdir -p tmp-htdocs/.well-known/acme-challenge

docker run -d --name webserver -p 80:80 --mount type=bind,source="$(pwd)"/tmp-htdocs,target=/usr/local/apache2/htdocs --rm httpd

docker run -it \
   --mount type=bind,source="$(pwd)"/certs,target=/data \
   --mount type=bind,source="$(pwd)"/tmp-htdocs/.well-known/acme-challenge,target=/webroot \
  -u $(id -u) --rm zerossl/client \
  --key account.key --csr domain.csr --csr-key server.key --crt server.crt \
  --domains novusvm1.westeurope.cloudapp.azure.com --generate-missing --path /webroot --unlink \
  --live

docker stop webserver
rm -r tmp-htdocs
