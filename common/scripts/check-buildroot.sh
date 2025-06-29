#!/bin/bash -e

RK_SCRIPTS_DIR="${RK_SCRIPTS_DIR:-$(dirname "$(realpath "$0")")}"
RK_SDK_DIR="${RK_SDK_DIR:-$RK_SCRIPTS_DIR/../../../..}"
BUILDROOT_DIR="$RK_SDK_DIR/buildroot"

# Check access to buildroot mirror
"$RK_SCRIPTS_DIR/check-network.sh" sources.buildroot.net sources.buildroot.net \
	"Please retry later (it could be down for a while) or setup a VPN to bypass the GFW."

# The new buildroot Makefile needs make (>= 4.0)
if ! "$BUILDROOT_DIR/support/dependencies/check-host-make.sh" 4.0 make \
	> /dev/null; then
	echo -e "\e[35m"
	echo "Your make is too old: $(make -v | head -n 1)"
	echo "Please update it:"
	echo "git clone https://github.com/mirror/make.git --depth 1 -b 4.2"
	echo "cd make"
	echo "git am $BUILDROOT_DIR/package/make/*.patch"
	echo "autoreconf -f -i"
	echo "./configure"
	echo "sudo make install -j8"
	echo -e "\e[0m"
	exit 1
fi

"$RK_SCRIPTS_DIR/check-header.sh" libc6 dirent.h libc6-dev

# Buildroot brmake needs unbuffer
"$RK_SCRIPTS_DIR/check-package.sh" unbuffer unbuffer "expect expect-dev"
