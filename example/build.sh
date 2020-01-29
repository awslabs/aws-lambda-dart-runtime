#!/bin/sh

# setting cacke folder
export PUB_CACHE=/tmp

# creating a temporary directory for the build
cd $(mktemp -d)

# pub the app
cp -Rp /app/* .
ls -l
# setup deps
/usr/lib/dart/bin/pub get
# build the binary
/usr/lib/dart/bin/dart2native lib/main.dart -o bootstrap
# move this back to app
mv bootstrap /app/bootstrap