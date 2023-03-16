#!/usr/bin/env sh
set -e

cp index.* public/

echo "Sending to remote"
rsync -ru public/. david@davidkopp.de:/var/www/html --delete

echo "Finished."
