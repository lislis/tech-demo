#!/bin/sh

BUILD_DIR=~/tech-demo
CACHE_DIR=~/cache

# Default Hugo version
DEFAULT_HUGO_VERSION="0.49.2"

export HUGO_VERSION=$DEFAULT_HUGO_VERSION

# Hugo URL ( download from GH builds )
RELEASE_NAME=hugo_${HUGO_VERSION}_Linux-64bit
FILE_NAME=${RELEASE_NAME}.tar.gz
HUGO_PACKAGE=https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${FILE_NAME}

# Store the hugo package in the cache_dir ( persistent across builds )
mkdir -p $CACHE_DIR
if ! [ -e $CACHE_DIR/$FILE_NAME ]; then
  echo "\n-----> Fetching Hugo ${HUGO_VERSION} binaries at ${HUGO_PACKAGE}"
  curl $HUGO_PACKAGE -L -s -o $CACHE_DIR/$FILE_NAME
fi

# Extract the binary in the working directory
echo "\n-----> Extracting Hugo ${HUGO_VERSION} binaries to ${BUILD_DIR}"
mkdir -p $CACHE_DIR/$RELEASE_NAME
tar -zxvf $CACHE_DIR/$FILE_NAME -C $CACHE_DIR
mv $CACHE_DIR $BUILD_DIR/hugo
