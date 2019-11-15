#!/bin/sh

# move krb5.conf to persitent storage and ln back to /etc

if [ ! -f /var/lib/krb5kdc/krb5.conf ]; then

    mv /etc/krb5.conf /var/lib/krb5kdc
    ln -s /var/lib/krb5kdc/krb5.conf /etc/krb5.conf
else
    rm /etc/krb5.conf
    ln -s /var/lib/krb5kdc/krb5.conf /etc/krb5.conf
fi

/bin/ash
/usr/bin/supervisord -c /etc/supervisord.conf