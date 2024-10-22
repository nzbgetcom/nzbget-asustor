#!/bin/bash

set -e

mkdir -p build
cd build
rm *.apk || true

if [ ! -f "apkg-tools_py3.py" ]; then
    curl -O https://downloadgb.asustor.com/developer/APKG_Utilities_2.0_0517.zip
    unzip *.zip
    rm apkg-tools_py2.py
    rm *.zip
fi

fakeroot python3 apkg-tools_py3.py create ../nzbget
