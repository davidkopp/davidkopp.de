#!/bin/bash
set -e

websites=("www.davidkopp.de" "notes.davidkopp.de" "cloud.davidkopp.de")
reports_dir=/tmp/reports

mkdir -p ${reports_dir}

for website in "${websites[@]}"
do
  sudo -u www-data zcat -f /var/log/nginx/${website}-access.log* > /tmp/${website}-access.log
  goaccess --log-format combined /tmp/${website}-access.log > ${reports_dir}/${website}.html
done
