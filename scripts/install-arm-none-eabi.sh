#!/bin/bash
#
# User editable variables:
ARM_NONE_EABI_VERSION="12.3.rel1"

# Script
ARCHIVE_FILE="arm-gnu-toolchain-$ARM_NONE_EABI_VERSION-x86_64-arm-none-eabi.tar.xz"
ARCHIVE_URL="https://developer.arm.com/-/media/Files/downloads/gnu/$ARM_NONE_EABI_VERSION/binrel/$ARCHIVE_FILE"
DOWNLOAD_CMD=""

if [ -x "$(command -v aria2c)" ]; then
	DOWNLOAD_CMD=('aria2c' '-x' '16' $ARCHIVE_URL)
elif [ -x "$(command -v wget)" ]; then
	DOWNLOAD_CMD=('wget' $ARCHIVE_URL)
elif [ -x "$(command -v curl)" ]; then
	DOWNLOAD_CMD=('curl' $ARCHIVE_URL)
else
	echo "unable to locate download tool!"
	exit 1
fi

if [ ! -f $ARCHIVE_FILE ]; then
	"${DOWNLOAD_CMD[@]}"
fi

if [ -f $ARCHIVE_FILE ]; then

	tar xvf $ARCHIVE_FILE -C /usr/share/
	
	for f in /usr/share/arm-gnu-toolchain-$ARM_NONE_EABI_VERSION-x86_64-arm-none-eabi/bin/*; do
		[ -e "$f" ] || continue
		bname=$(basename $f)
		ln -s "$f" "/usr/bin/$bname"
	done
fi

