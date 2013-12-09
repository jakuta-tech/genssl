#!/bin/bash

keyname="default"
if [ -z $1 ]; then
    echo "give crt/key name"
    exit 1
else
    keyname=$1
fi

source values.sh 

echo "GENERATE $keyname"
openssl req -new -keyform PEM -keyout "${keyname}.key" -outform PEM -out "${keyname}.csr" -nodes -newkey rsa:$size -subj "${subj}"
echo "SIGNING"
openssl x509 -CA "${ca_name}.crt" -CAkey "${ca_name}.key" -CAserial serial -req -in "${keyname}.csr" -outform PEM -out "${keyname}.crt" -days $days
