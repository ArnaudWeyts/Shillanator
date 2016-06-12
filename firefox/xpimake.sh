#!/bin/bash -e
# this uses npm & jpm to make the xpi file
jpm xpi
jpm sign --api-key $FIREFOX_API --api-secret $FIREFOX_SECRET --xpi *.xpi
rm @*.xpi