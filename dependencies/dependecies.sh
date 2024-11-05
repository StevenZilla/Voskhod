#!/bin/bash
apt install composer php7.3-curl php7.3-dom php7.3-gd php7.3-intl php7.3-zip php7.3-bcmath rsync binutils -y
mkdir -p /usr/local/lib/nodejs
tar -xJvf ./node-v10.19.0-linux-x64.tar.xz -C /tmp
cp -r /tmp/node-v10.19.0-linux-x64/{lib,share,include,bin} /usr

php composer-setup.php --quiet --install-dir /usr/bin --filename composer
RESULT=$?
rm /tmp/composer-setup.php
exit $RESULT

