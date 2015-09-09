#!/usr/bin/env python
# -*- coding: utf-8 -*-

from jinja2 import Environment, PackageLoader

def main():
    env = Environment(loader=PackageLoader('openssl', 'templates'))

    template = env.get_template('openssl.cnf.j2')


    values = {
            'default_ca': 'test',
            'default_md': 'sha512',
            'default_bits': 2048,
            'default_keyfile': 'test.key',
            'encrypt_key': 'no',
            'countryName': 'FR',
            'state': 'France',
            'localityName': 'Lille',
            'organizationName': 'Perso',
            'organizationUnitName': 'PersoU',
            'commonName': 'test.c.n',
            'emailAddress': 'florent@peterschmitt.fr',
            'subjectAltNames': [
                'DNS:test.s.n'
                ],
            'days': 3
            }

    print(template.render(**values))

main()
