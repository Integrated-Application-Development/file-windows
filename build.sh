#!/bin/bash
mkdir dist/
cd libgnurx-2.5
make
sudo cp regex.h /usr/i686-w64-mingw32/include/
sudo cp libregex.a /usr/i686-w64-mingw32/lib/
sudo cp libgnurx.dll.a /usr/i686-w64-mingw32/lib/
cp COPYING.LIB ../dist/COPYING.libgnurx
cp libgnurx-0.dll ../dist/
cd ../file/
autoreconf -f -i
./configure --disable-silent-rules --enable-fsect-man5
make -j4
cp magic/magic.mgc ../dist/
make clean
# Using CC param instead of passing LDFLAGS='-static-libgcc' due to a bug in libtool.
./configure CC='i686-w64-mingw32-gcc -static-libgcc' --disable-silent-rules --enable-fsect-man5 --host=i686-w64-mingw32
make -j4
cp src/.libs/libmagic-1.dll ../dist/
cp src/.libs/file.exe ../dist/
cp COPYING ../dist/COPYING.file
