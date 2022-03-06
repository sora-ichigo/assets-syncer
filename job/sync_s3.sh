#!/bin/bash
readonly TARGET_DIR="images/"

if [[ ! -d $TARGET_DIR ]]; then
  echo "[error] Not Found target directory ${TARGET_DIR}" >&2
  exit
fi

fswatch -0 $TARGET_DIR | while read -d "" event; do
  echo "syncing.."
  ./sync_images.sh
done
