#!/bin/bash

set -e

# Sync files
cp -r /homeassistant/config /gitsync/config
cp /homeassistant/configuration.yaml /gitsync/configuration.yaml

# Push to git
cd /gitsync
git add .

if git diff --staged --quiet; then
  echo "Nothing to commit"
  exit 0
fi

git commit -m "sync: $(date '+%Y-%m-%d %H:%M')"
git push
