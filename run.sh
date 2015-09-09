#!/bin/bash
echo "GENERATE NEW KEY"
openssl req -new -keyform PEM -outform PEM -out csr/test.csr -config openssl.cnf
echo "AUTOSIGN NEW KEY"
openssl x509 -signkey keys/test.key -req -in csr/test.csr -outform PEM -out certs/test.crt
