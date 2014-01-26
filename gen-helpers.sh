#!/bin/sh

gen_certs() {
    for domain in ${domains}; do
        export common_name="${domain}"
        export name="${section}-${common_name}"
        ./gen-keys.sh
    done
}
