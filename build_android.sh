#!/bin/bash
set -e

rm -rf build_android
mkdir -p build_android

# compile others
cd build_android

ANDROID_NDK="${HOME}/Android/Sdk/ndk-bundle"

cmake -DCMAKE_TOOLCHAIN_FILE="$ANDROID_NDK/build/cmake/android.toolchain.cmake" \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
      -DCMAKE_INSTALL_PREFIX="install" \
      -DCMAKE_BUILD_TYPE="Debug" \
      -DANDROID_ABI="arm64-v8a" \
      -DANDROID_PLATFORM="android-28" \
      -DANDROID_ARM_NEON="True" \
      ../

make