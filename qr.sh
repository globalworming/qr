#!/bin/bash

# Check if a URL is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <URL> <title>"
  echo "Example: $0 'https://example.com' 'example'"
  exit 1
fi

URL="$1"
TITLE="${2:-QR Code}"
OUTPUT_DIR="qrcodes/$TITLE"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo "Generating QR code variants for: $URL"

qrencode -m2 -s 100 -l L -v 1 -o "$OUTPUT_DIR/1.png" "$URL"
qrencode -m2 -s 100 -l M -o "$OUTPUT_DIR/2.png" "$URL"
qrencode -m2 -s 100 -l H -v 4 -o "$OUTPUT_DIR/3.png" "$URL"

echo "All QR code variants generated in the '$OUTPUT_DIR' directory."
