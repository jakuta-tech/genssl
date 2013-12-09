#!/bin/bash

source values.sh

if [ ! -e serial ]; then
    echo -n '01' > serial
fi
openssl req -new -x509 -keyout "${ca_name}.key" -keyform $format -out "${ca_name}.crt" -outform $format -days $ca_days -nodes -newkey rsa:$ca_size -subj "${ca_subj}"
