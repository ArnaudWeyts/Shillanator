#!/bin/bash -e
# this uses npm & jpm to make the xpi file
jpm xpi
jpm sign --api-key $FIREFOX_API --api-secret $FIREFOX_SECRET --xpi @shillanator-0.1.2.xpi