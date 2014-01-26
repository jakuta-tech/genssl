#!/bin/sh

if [ ! -z "${1}" ]; then
    name="${1}"
fi

. ./values.sh || exit 1

if [ "$protect" = "no" ]; then
    extra_opts="${extra_opts} -nodes"
fi

echo "GENERATE $name" 1>&2
openssl req -new -keyform PEM -keyout "${name}.key" -outform PEM -out "${name}.csr" -nodes -newkey rsa:${size} -subj "${subj}" ${extra_opts}
echo "SIGNING with ${ca_name}" 1>&2
openssl x509 -CA "${ca_name}.crt" -CAkey "${ca_name}.key" -CAserial serial -req -in "${name}.csr" -outform PEM -out "${name}.crt" -days $days
