#!/usr/bin/env bash

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./Tools/config

# Generate configure files first.
./autogen.sh || (echo "[FATAL] Failed to run autogen.sh" && exit 1)

./configure \
  --prefix="${PREFIX}" \
  --host="${HOST}" \
  --with-pcre2-prefix="${PREFIX}" \
  --without-alllang || (echo "[FATAL] Failed to run configure" && exit 2)

make -j${CPU_COUNT} ${VERBOSE_AT}
make install

# cmake prefers the versioned symlink:
# https://github.com/Kitware/CMake/blob/v3.28.1/Modules/FindSWIG.cmake#L89
ln -sf ${PREFIX}/bin/swig ${PREFIX}/bin/swig4.0
