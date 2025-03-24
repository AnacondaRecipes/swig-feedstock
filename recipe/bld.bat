cmake -G "NMake Makefiles" ^
  -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
  -DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX% ^
  . || exit 1

cmake --build . --config Release --target install || exit 2
