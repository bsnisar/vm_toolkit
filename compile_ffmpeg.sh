#!/bin/bash

function Yum() {
  yum-config-manager --add-repo http://www.nasm.us/nasm.repo && \
  yum install -y autoconf automake bzip2 cmake freetype-devel gcc gcc-c++ git libtool make mercurial nasm pkgconfig zlib-devel curl wget
}

function Yasm() {
  mkdir ~/ffmpeg_sources && \
  cd ~/ffmpeg_sources && \
  curl -O http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz && \
  tar xzvf yasm-1.3.0.tar.gz && \
  cd yasm-1.3.0 && \
  ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && \
  make && make install &&\
  echo "Done ${FUNCNAME[0]}" && \
  echo
}

function libx264() {
  cd ~/ffmpeg_sources && \
  git clone --depth 1 http://git.videolan.org/git/x264 && \
  cd x264 && \
  PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static && \
  make && make install && \
  echo "Done ${FUNCNAME[0]}" && \
  echo
}

function libx265() {
  cd ~/ffmpeg_sources && \
  hg clone https://bitbucket.org/multicoreware/x265 && \
  cd ~/ffmpeg_sources/x265/build/linux && \
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED:bool=off ../../source && \
  make && make install && \
  echo "Done ${FUNCNAME[0]}" && \
  echo
}

function libfdk_aac() {
  cd ~/ffmpeg_sources && \
  git clone --depth 1 https://github.com/mstorsjo/fdk-aac && \
  cd fdk-aac && \
  autoreconf -fiv && \
  ./configure --prefix="$HOME/ffmpeg_build" --disable-shared && \
  make && \
  make install && \
  echo "Done ${FUNCNAME[0]}" && \
  echo
}

function libmp3lame () {
  cd ~/ffmpeg_sources && \
  curl -L -O http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz && \
  tar xzvf lame-3.99.5.tar.gz && \
  cd lame-3.99.5 && \
  ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --disable-shared --enable-nasm && \
  make && \
  make install && \
  echo "Done ${FUNCNAME[0]}" && \
  echo
}

function libopus () {
  cd ~/ffmpeg_sources && \
  wget https://archive.mozilla.org/pub/opus/opus-1.1.5.tar.gz && \
  tar xzvf opus-1.1.5.tar.gz && \
  cd opus-1.1.5 && \
  ./configure --prefix="$HOME/ffmpeg_build" --disable-shared && \
  make && \
  make install && \
  echo "Done ${FUNCNAME[0]}" && \
  echo
}

function libogg () {
  cd ~/ffmpeg_sources && \
  wget http://downloads.xiph.org/releases/ogg/libogg-1.3.2.tar.gz && \
  tar xzvf libogg-1.3.2.tar.gz && \
  cd libogg-1.3.2 && \
  ./configure --prefix="$HOME/ffmpeg_build" --disable-shared && \
  make && \
  make install && \
  echo "Done ${FUNCNAME[0]}" && \
  echo
}

function libvorbis () {
  cd ~/ffmpeg_sources && \
  wget http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.4.tar.gz && \
  tar xzvf libvorbis-1.3.4.tar.gz && \
  cd libvorbis-1.3.4 && \
  ./configure --prefix="$HOME/ffmpeg_build" --with-ogg="$HOME/ffmpeg_build" --disable-shared && \
  make && \
  make install && \
  echo "Done ${FUNCNAME[0]}" && \
  echo
}

function libvpx () {
  cd ~/ffmpeg_sources && \
  git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git && \
  cd libvpx && \
  ./configure --prefix="$HOME/ffmpeg_build" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm && \
  PATH="$HOME/bin:$PATH" && make && \
  make install && \
  echo "Done ${FUNCNAME[0]}" && \
  echo
}


function FFmpeg() {
  cd ~/ffmpeg_sources && \
  curl -O http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
  tar xjvf ffmpeg-snapshot.tar.bz2 && \
  cd ffmpeg && \
  PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" && \
  ./configure --prefix="$HOME/ffmpeg_build" \
    --extra-cflags="-I$HOME/ffmpeg_build/include" --extra-ldflags="-L$HOME/ffmpeg_build/lib -ldl" \
    --bindir="$HOME/bin" --pkg-config-flags="--static" \
    --enable-gpl \
    --enable-libfdk_aac \
    --enable-libfreetype \
    --enable-libmp3lame \
    --enable-libopus \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libx264 \
    --enable-libx265 \
    --enable-nonfree && \
  make && \
  make install && \
  echo "Done ${FUNCNAME[0]}" && \
  hash -r
}

Yum && \
Yasm && \
libx264 && \
libx265 && \
libfdk_aac \
&& \
libmp3lame && \
libopus && \
libogg && \
libvorbis && \
libvpx && \
FFmpeg
