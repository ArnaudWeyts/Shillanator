#!/bin/bash -e
# this uses npm & jpm to make the xpi file
cd "$TRAVIS_BUILD_DIR"
#gets the right version
VERSION="$(git name-rev --tags --name-only $(git rev-parse HEAD))"
cd "$TRAVIS_BUILD_DIR/firefox"
# installs dependencies
npm install
# set path so jpm can be used wihout npm
export PATH="$TRAVIS_BUILD_DIR/firefox/node_modules/.bin/:$PATH"
jpm xpi
# if beta => don't sign
if [[ $VERSION != *"beta"* ]];then
    jpm sign --api-key $FIREFOX_API --api-secret $FIREFOX_SECRET --xpi *.xpi
    rm @*.xpi
fi
# move the xpi file to the root directory
mv "shillanator*.xpi" "$TRAVIS_BUILD_DIR/firefox.xpi"