#!/bin/bash
FILE_ID=$1
DESTINATION=$2

CONFIRM=$(curl -sc /tmp/gcookie "https://drive.google.com/uc?export=download&id=${FILE_ID}" | \
          grep -o 'confirm=[^&]*' | sed 's/confirm=//')

curl -Lb /tmp/gcookie "https://drive.google.com/uc?export=download&confirm=${CONFIRM}&id=${FILE_ID}" -o "${DESTINATION}"
