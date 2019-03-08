#!/bin/bash -e

. config

CURDIR=$(pwd)
CHANGESET_DIR="$CURDIR/patches/changeset_5601"
PJPROJECT_BASE_FOLDER="$DOWNLOAD_DIR/$PJSIP_DIR_NAME"

cp $CHANGESET_DIR/changeset_5601.patch $PJPROJECT_BASE_FOLDER

cd "$PJPROJECT_BASE_FOLDER"
patch -p0 < changeset_5601.patch
rm changeset_5601.patch
cd "$CHANGESET_DIR"