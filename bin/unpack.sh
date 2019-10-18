#!/bin/env bash
source "$(dirname $0)/config.sh"

test -d $RELEASES_DIR || mkdir $RELEASES_DIR
UNPACK_DIR=${RELEASES_DIR}/`date -Iseconds`

echo $($1 || $LATEST_BUILD)
file=$1 || $LATEST_BUILD

if [ -z "$file"]; then
  file=$LATEST_BUILD
fi

echo "Unpacking $file into $UNPACK_DIR.."

mkdir $UNPACK_DIR

unzip $file -d $UNPACK_DIR > $LOG_DIR/unpacking.log

echo "Switch current"
rm -f $CURRENT_DIR
ln -s $UNPACK_DIR $CURRENT_DIR
