#!/bin/sh

if [ ! -z "${1}" ]; then
    name="${1}"
fi

if [ ! -e values.sh ]; then
    cat values.sample.sh > values.sh
    chmod +x values.sh
fi

. ./values.sh

if [ ! -e ${ca_name}.ca.crt ]||[ ! -e ${ca_name}.ca.key ]; then
    echo "Generate the CA first." 1>&2
    exit 1
fi

if [ "$protect" = "no" ]; then
    extra_opts="${extra_opts} -nodes"
fi

echo "GENERATE $name" 1>&2
openssl req -new -keyform PEM -keyout "${name}.key" -outform PEM -out "${name}.csr" -nodes -newkey rsa:${size} -subj "${subj}" ${extra_opts}
echo "SIGNING with ${ca_name}" 1>&2
openssl x509 -CA "${ca_name}.ca.crt" -CAkey "${ca_name}.ca.key" -CAserial serial -req -in "${name}.csr" -outform PEM -out "${name}.crt" -days $days
