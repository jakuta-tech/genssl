#!/usr/bin/env bash

gen_certs() {
    for domain in ${domains}; do
        export common_name="${domain}"
        export name="${section}-${common_name}"
        ./gen-keys.sh
    done
}

gen_ident_certs() {
    for domain in ${domains}; do
        export common_name="${domain}"
        export name="${section}-${common_name}"
        ./gen-keys.sh
        . ./values.sh
        openssl pkcs12 -export -out keys/${name}.p12 -inkey keys/${name}.key -in certs/${name}.crt -certfile ca/certs/${ca_name}.ca.crt
    done
}
