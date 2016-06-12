#!/bin/bash -e
# this uses npm & jpm to make the xpi file
cd ..
VERSION="$(git name-rev --tags --name-only $(git rev-parse HEAD))"
cd firefox
jpm xpi
jpm sign --api-key $FIREFOX_API --api-secret $FIREFOX_SECRET --xpi @shillanator-$VERSION.xpi
rm @*.xpi