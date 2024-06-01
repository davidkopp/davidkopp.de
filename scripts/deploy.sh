#!/usr/bin/env sh
set -e

mkdir -p public
cp index.* public/

echo "Sending to remote"
rsync -ru public/. david@davidkopp.de:/var/www/www.davidkopp.de/

echo "Finished."
