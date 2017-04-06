#!/bin/bash
cp TEMPLATE.md README.md

cat versions.txt | while read version; do
  
  if [[ $version > 1.3 ]] && [[ $version != 1.3.0 ]]; then
    prebuilt=""
  else
    prebuilt="-prebuilt"
  fi
  npm install electron$prebuilt@$version
  ELECTRON=./node_modules/electron$prebuilt/cli.js
  (echo -n "$version | "; ELECTRON_RUN_AS_NODE=1 $ELECTRON abi.js) >> README.md
  rm -rf node_modules/electron$prebuilt

done
cat README.md
