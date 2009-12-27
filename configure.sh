#!/bin/bash
#
# configure.sh -- Custom configure script
# Call: CYGWIN-PATCHES/configure.sh <relative-install-dir>

function Configure()
{
    local instdir="$1"
    instdir=${instdir%/}  # Remove trailing slash

    if  [ -z  "$instdir" ] || [ ! -d $instdir ]; then
        echo "$0: [ERROR] No such dir [$instdir]"
        exit 1
    else
        #   EXAMPLE: Any custom configuration options

        ./configure                     \
        --prefix=/usr                   \
        --sysconfdir=/etc               \
        --libexecdir='${sbindir}'       \
        --exec-prefix=/usr              \
        --localstatedir=/var            \
        --datadir='${prefix}/share'     \
        --mandir='${prefix}/share/man'  \
        --infodir='${prefix}/share/info'\
        --libdir='${prefix}/lib'        \
        --includedir='${prefix}include' \
	--enable-default-8bit           \
	--with-db

    fi
}

Configure $*

# End of file
