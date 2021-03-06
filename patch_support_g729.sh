#!/bin/bash -e

. config

CURDIR=$(pwd)
G729_DIR="$CURDIR/patches/support_g729"
PJPROJECT_BASE_FOLDER="$DOWNLOAD_DIR/${PJSIP_DIR_NAME}"


if [ "$PJSIP_VERSION" == "2.8" ]
then
    cp $G729_DIR/g729.patch $DOWNLOAD_DIR/${PJSIP_DIR_NAME}/
else
    cp $G729_DIR/g729_old.patch $DOWNLOAD_DIR/${PJSIP_DIR_NAME}/g729.patch
fi

cd "$PJPROJECT_BASE_FOLDER"
patch -p0 < g729.patch
rm g729.patch

cd "$G729_DIR"
cp g729.c "${PJPROJECT_BASE_FOLDER}/pjmedia/src/pjmedia-codec/g729.c"
cp g729.h "${PJPROJECT_BASE_FOLDER}/pjmedia/include/pjmedia-codec/g729.h"
cp -r g729 "${PJPROJECT_BASE_FOLDER}/third_party"
mkdir -p "${PJPROJECT_BASE_FOLDER}/third_party/build/g729"
mv "${PJPROJECT_BASE_FOLDER}/third_party/g729/Makefile" "${PJPROJECT_BASE_FOLDER}/third_party/build/g729"
cd "${PJPROJECT_BASE_FOLDER}"
rm -rf aconfigure
autoconf aconfigure.ac > aconfigure
sudo chmod 777 aconfigure
