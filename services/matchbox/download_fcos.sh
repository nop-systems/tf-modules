#!/bin/bash

set -exuo pipefail

FCOS_STREAM="${FCOS_STREAM:-stable}"
DOWNLOAD_DIR=${DOWNLOAD_DIR:-/assets}
mkdir -p "$DOWNLOAD_DIR"
cd "$DOWNLOAD_DIR"
release=$(curl "https://builds.coreos.fedoraproject.org/streams/${FCOS_STREAM}.json" |
    jq --raw-output .architectures.x86_64.artifacts.metal.release)

downloads=$(coreos-installer download -f pxe)

IFS=$'\n'
GLOBIGNORE=
for file in $downloads; do
    ln -sf "$file" "${file//$release-/}"
    GLOBIGNORE=$GLOBIGNORE:$file:$file.sig:${file//$release-/}
done

rm -f -- ./*
