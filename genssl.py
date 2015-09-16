#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os

from jinja2 import Environment, FileSystemLoader

class CertInfos(object):
    default_ca = None
    default_md = None
    default_bits = 2048
    default_keyfile = '{0}.key'
    encrypt_key = 'no'
    countryName = None
    state = None
    localityName = None
    organizationName = None
    organizationUnitName = None
    commonName = None
    emailAddress = None
    __san = []
    days = 1

    @property
    def subjectAltNames(self):
        return self.__san

class CertManager(object):
    def __init__(self, *args, **kwargs):
        _dirs = ('keys', 'csr', 'certs')

        for _dir in _dirs:
            if not os.path.isdir(_dir):
                os.makedirs(_dir)

        self.__tenv = Environment(loader=FileSystemLoader('templates'))
        self.__template = self.__tenv.get_template('openssl.cnf.j2')

        super(CertManager, self).__init__(*args, **kwargs)

    def createKeyPair(self, keyname, values):
        openssl_cnf = self.__template.render(**values)
        with open('openssl.cnf', 'w') as f:
            f.write(openssl_cnf)

        os.system('openssl req -new -keyform PEM -outform PEM -out csr/{0}.csr -config openssl.cnf'.format(values['commonName']))# -keyout keys/{0}.key -nodes'.format(values['commonName']))
        os.system('openssl x509 -signkey keys/{0}.key -req -in csr/{0}.csr -outform PEM -out certs/{0}.crt'.format(values['commonName']))

def main():

    cm = CertManager()

    _keyname = 'test.c.n'
    values = {
            'subjectAltNames': [
                'DNS:test.s.n'
                ],
            'days': 3
            }

    cm.createKeyPair(_keyname, values)

if __name__ == '__main__':
    main()
