#!/bin/bash -e

. config

CURDIR=$(pwd)
FIXED_CALLID_DIR="$CURDIR/patches/fixed_callid"
PJPROJECT_BASE_FOLDER="$DOWNLOAD_DIR/${PJSIP_DIR_NAME}"


cp $FIXED_CALLID_DIR/callid.patch $PJPROJECT_BASE_FOLDER
cd "$PJPROJECT_BASE_FOLDER"
patch -p0 < callid.patch
rm callid.patch

# Changing PJSIP_MAX_URL_SIZE --- see README.md for more information
# sed -i -r 's~(#[ \t]*(define[ \t]+PJSIP_MAX_URL_SIZE)[ \t]+)(256){1}~\1512~g' $PJPROJECT_BASE_FOLDER/pjsip/include/pjsip/sip_config.h
sed -i.bak $'s/.*define PJSIP_MAX_URL_SIZE\s*.*/\#   define PJSIP_MAX_URL_SIZE     1512/g' $PJPROJECT_BASE_FOLDER/pjsip/include/pjsip/sip_config.h
cd "$FIXED_CALLID_DIR"
