TOOLCHAIN=$(pwd)/toolchain/bin
CROSS_COMPILE=$TOOLCHAIN/mips-linux-gnu-
export CC=${CROSS_COMPILE}gcc
export CFLAGS="-muclibc -O3"
export CPPFLAGS="-muclibc -O3"
export LDFLAGS="-muclibc -O3"

cd live
./genMakefiles dafang
make clean
make
make install
cd ..

cd opus
./autogen.sh
./configure --host=mips-linux --prefix=$(pwd)/_install
make
make install
cd ..

cd lame
./configure --host=mips-linux-gnu --prefix=$(pwd)/_install
make libmp3lame.so
make install
cd ..

cd freetype2
./autogen.sh --host=mips-linux-gnu --without-harfbuzz --without-png --without-zlib --prefix=$(pwd)/_install
./configure --host=mips-linux-gnu --without-harfbuzz --without-png --without-zlib --prefix=$(pwd)/_install
make install
cd ..

