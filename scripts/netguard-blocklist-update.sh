#!/bin/bash
## Auto update NetGuard blocklist
## https://www.kuketz-blog.de/netguard-datenverkehr-von-android-apps-filtern-privatsphaere-schuetzen/

set -e

mkdir -p /tmp && cd /tmp

# Download blocklists
curl -s https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts > netguard_steven
curl -s https://block.energized.pro/blu/formats/hosts.txt > netguard_energized_blu
curl -s https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/android-tracking.txt > netguard_android_tracking

# Convert 'netguard_android_tracking' blocklist for NetGuard
command grep "^[^#;]" netguard_android_tracking | sed 's/^/0.0.0.0 /' > netguard_android_tracking_clean

# Combine blocklists
cat netguard_steven netguard_energized_blu netguard_android_tracking_clean > netguard_blocklist

# Remove domains from blocklist (overblocking)
# sed -i '/0.0.0.0 example.com/d' netguard_blocklist

# Copy blocklist to webserver folder
cp netguard_blocklist /var/www/www.davidkopp.de/
