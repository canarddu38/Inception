#!/bin/sh
set -e

echo "Started conf adminer"

cd /usr/share/adminer/
chmod +x ./compile.php
./compile.php
mv adminer-*.php index.php



exec php -S 0.0.0.0:8000