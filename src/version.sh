#!/bin/bash -e
# manages the versions of all the extensions
VERSION="$(git name-rev --tags --name-only $(git rev-parse HEAD))"
perl -pi.back -e  "s/(?<=\"version\": \")(\S+)(?=\")/$VERSION/g" chrome/manifest.json
perl -pi.back -e  "s/(?<=\"version\": \")(\S+)(?=\")/$VERSION/g" firefox/package.json