#!/usr/bin/env bash

gen_certs() {
    for domain in ${domains}; do
        export common_name="${domain}"
        export name="${section}-${common_name}"
        ./gen-keys.sh || exit 1
    done
}

gen_ident_certs() {
    export extra_opts="${extra_opts} -extensions clientauth"
    for person in ${persons}; do
        export common_name="${person} at ${domain}"
        export name="${section}-${person}"
        ./gen-keys.sh || exit 1
        . ./values.sh
        openssl pkcs12 -export -out keys/${name}.p12 \
            -inkey keys/${name}.key \
            -in certs/${name}.crt \
            -certfile ca/certs/${ca_name}.ca.crt \
            -password pass:"" || exit 1
    done
}
