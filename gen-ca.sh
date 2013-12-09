#!/bin/sh

. ./values.sh

if [ ! -e serial ]; then
    echo -n '01' > serial
fi

extra_opts=""

if [ "$ca_protect" = "no" ]; then
    extra_opts="$extra_opts -nodes"
fi

openssl req -new -x509 -keyout "${ca_name}.key" -keyform $format -out "${ca_name}.crt" -outform $format -days $ca_days -newkey rsa:$ca_size -subj "${ca_subj}" $extra_opts
