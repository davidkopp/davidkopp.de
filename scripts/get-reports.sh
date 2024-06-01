#!/bin/bash
set -e

MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ssh david@davidkopp.de 'bash -s' < $MY_DIR/generate-reports.sh

mkdir -p $MY_DIR/../reports/
rsync -aP david@davidkopp.de:/tmp/reports/ $MY_DIR/../reports
