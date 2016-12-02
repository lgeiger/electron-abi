#!/bin/bash
ELECTRON=./node_modules/electron-prebuilt/cli.js
cp TEMPLATE.md README.md

cat versions.txt | while read version; do
  npm install electron-prebuilt@$version
  (echo -n "$version | "; ELECTRON_RUN_AS_NODE=1 $ELECTRON abi.js) >> README.md
  rm -rf node_modules/electron-prebuilt
done
cat README.md
