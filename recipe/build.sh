#!/bin/bash

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./Tools/config

# Full paths break make check
export CC=$(basename ${CC})
export CXX=$(basename ${CXX})

"${SRC_DIR}"/configure \
--prefix="${PREFIX}" \
--with-pcre2-prefix="${PREFIX}" \
--without-alllang

make -j${CPU_COUNT}
#make check PY3=y
make install
