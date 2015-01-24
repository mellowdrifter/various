#!/bin/bash

#Encode
# v0.1 17.08.08 - First created
# Darren O'Connor <mellow.drifter@gmail.com>

# This script, when run in a folder full of FLAC files, will create high quality VBR mp3's for use in mp3 players.
# This version uses lame 3.98. If you use version 3.97 and below you'll need to change a few options

#Requires both flac and lame installed. Use brew to install if on MacOS

mkdir wav/
flac -d *.flac
mv *.wav wav/
cd wav/
for f in *.wav; do mv "$f" "${f%.wav}";done
mkdir ../mp3/
find * -exec lame -V0 -q0 '{}' -o '../mp3/{}' \;
cd ../mp3/
for FILE in *; do mv "$FILE" "$FILE.mp3"; done
cd ../
rm -r wav/