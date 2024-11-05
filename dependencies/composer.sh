#!/bin/sh

php composer-setup.php --quiet --install-dir /usr/bin --filename composer
RESULT=$?
rm /tmp/composer-setup.php
exit $RESULT
