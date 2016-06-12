#!/bin/bash -e
# this uses npm & jpm to make the xpi file
jpm xpi
if [[ $1 == "prod" ]]; then
    jpm sign --api-key $FIREFOX_API --api-secret $FIREFOX_SECRET --xpi *.xpi
    rm @*.xpi
fi
mv *.xpi ../firefox.xpi