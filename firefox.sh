#!/bin/bash -e
cd firefox
npm install
VERSION="$(git name-rev --tags --name-only $(git rev-parse HEAD))"
if [[ $VERSION == *"beta"* ]];then
    npm run xpimake-beta
else
    npm run xpimake-prod
fi