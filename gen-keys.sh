#!/bin/sh

keyname="default"
if [ -z $1 ]; then
    echo "give crt/key name"
    exit 1
else
    keyname=$1
fi

. ./values.sh 

if [ "$protect" = "no" ]; then
    extra_opts="${extra_opts} -nodes"
fi

echo "GENERATE $keyname"
openssl req -new -keyform PEM -keyout "${keyname}.key" -outform PEM -out "${keyname}.csr" -nodes -newkey rsa:$size -subj "${subj}" ${extra_opts}
echo "SIGNING"
openssl x509 -CA "${ca_name}.crt" -CAkey "${ca_name}.key" -CAserial serial -req -in "${keyname}.csr" -outform PEM -out "${keyname}.crt" -days $days
