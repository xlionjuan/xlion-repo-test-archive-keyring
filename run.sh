#!/bin/bash

set -ouex pipefail

echo "Merging keys..."
cat pubkeys/*.asc > pubkeys/merged.asc
gpg --dearmor --output debian/xlion-repo-test-archive-keyring.gpg pubkeys/merged.asc

echo ""
echo ""

echo "Building..."
debuild -us -uc -b
echo ""

echo "Moving deb to current folder..."
mv ../xlion-repo-test-archive-keyring*.deb .

echo " Cleaning up..."
rm -r ../xlion-repo-test-archive-keyring*.{changes,buildinfo,build}
rm -r debian/.debhelper
rm debian/debhelper-build-stamp
rm debian/files
rm debian/*.substvars
rm debian/*.gpg
rm pubkeys/merged.asc
rm -r debian/xlion-repo-test-archive-keyring