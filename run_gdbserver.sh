set -e

DEVICE_PATH=/data/local/tmp/android-gdb/
adb shell mkdir -p $DEVICE_PATH

# ANDROID_NDK=$HOME/Android/Sdk/ndk-bundle

GDBSERVER=${ANDROID_NDK}/prebuilt/android-arm64/gdbserver/gdbserver

EXE=main

PORT=5039

adb forward tcp:$PORT tcp:$PORT
adb push $GDBSERVER $DEVICE_PATH
adb push build_android/bin/$EXE $DEVICE_PATH
adb shell $DEVICE_PATH/gdbserver :$PORT $DEVICE_PATH/$EXE