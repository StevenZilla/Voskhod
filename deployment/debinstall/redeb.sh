#!/usr/bin/env bash

# IMPORTANT
# Protect agaisnt mispelling a var and rm -rf /
set -u
set -e

SRC=/tmp/tr-archive-back-deb-src
DIST=/tmp/tr-archive-back-deb-dist
SYSROOT=${SRC}/sysroot
DEBIAN=${SRC}/DEBIAN

rm -rf ${DIST}
mkdir -p ${DIST}/

rm -rf ${SRC}
rsync -a deb-src/ ${SRC}/

mkdir -p ${SYSROOT}/var/www/tr-archive

mkdir -p ${SYSROOT}/var/www/tr-archive/trarchive-api-application

mkdir -p ${SYSROOT}/var/www/tr-archive/trarchive-notification

mkdir -p ${SYSROOT}/var/www/tr-archive/trarchivepublic

mkdir -p ${SYSROOT}/etc/systemd/system

rsync -a ../tr-archive-worker/. ${SYSROOT}/etc/systemd/system/. --exclude 'debinstall' --exclude 'readme.md' --exclude 'CHANGELOG.md' --exclude '.releaserc.yml' --exclude '.git' --exclude '.gitlab-ci.yml' --exclude 'VERSION.txt' --delete

rsync -a ../tr-archive-v/dist/. ${SYSROOT}/var/www/tr-archive/. --delete

rsync -a --exclude 'docker' --exclude '.git' --exclude 'cicd' --exclude '.ci*' ../tr-archive-back/. ${SYSROOT}/var/www/tr-archive/trarchive-api-application --delete

rsync -a --exclude 'cicd' --exclude '.git' --exclude '.ci*' ../tr-archive-notification/. ${SYSROOT}/var/www/tr-archive/trarchive-notification --delete

rsync -a --exclude 'Dockerfile' --exclude '.git' --exclude '.ci*' ../tr-archive-public-proxy-api/. ${SYSROOT}/var/www/tr-archive/trarchivepublic --delete

find ${SRC}/ -type d -exec chmod 0755 {} \;
find ${SRC}/ -type f -exec chmod go-w {} \;

let SIZE=`du -s ${SYSROOT} | sed s'/\s\+.*//'`+8
pushd ${SYSROOT}/
tar czf ${DIST}/data.tar.gz [a-z]*
popd
sed s"/SIZE/${SIZE}/" -i ${DEBIAN}/control
pushd ${DEBIAN}
tar czf ${DIST}/control.tar.gz *
popd

pushd ${DIST}/
echo 2.0 > ./debian-binary

find ${DIST}/ -type d -exec chmod 0755 {} \;
find ${DIST}/ -type f -exec chmod go-w {} \;
ar r ${DIST}/tr-archive.deb debian-binary control.tar.gz data.tar.gz
popd
rsync -a ${DIST}/tr-archive.deb ./
