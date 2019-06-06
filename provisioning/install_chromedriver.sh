#!/usr/bin/env bash

set -e

VERSION="74.0.3729.6"

OS_NAME="linux64"
if [[ $(uname) == "Darwin" ]]; then
  OS_NAME="mac64"
fi

mkdir -p build/install_libraries
cd build/install_libraries

echo ">>> Installing chromedriver for ${OS_NAME}"
echo ">>> Downloading..."
OS_NAME="mac64"
brew install wget
wget https://chromedriver.storage.googleapis.com/${VERSION}/chromedriver_${OS_NAME}.zip

echo ">>> Installing..."
tar -xvzf chromedriver_${OS_NAME}.zip
chmod +x chromedriver

mkdir -p bin
mv chromedriver bin

echo ">>> Cleaning up..."
rm chromedriver_${OS_NAME}.zip

echo ">>> Done"
