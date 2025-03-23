#!/bin/sh

set -eux

OUTPUT_FILE=$1

if test -z "$OUTPUT_FILE"; then
  echo "No output file given"
  exit 1
fi

if secret_id=$(vault unwrap --field secret_id); then
  cat >"$OUTPUT_FILE" <<EOT
$secret_id
EOT
else
  echo "=> No secret_id obtained"
fi
