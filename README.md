# Remote debug Android ADB shell executable with VSCode

## 1. Setup NDK environment variable in .bashrc
```bash
export ANDROID_NDK=~/Android/Sdk/ndk-bundle
```

## 2. Compile main.cpp with debugging option
```bash
$ANDROID_NDK/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ -target aarch64-linux-android21 -g -O0 main.cpp
```

## 3. Create launch.json file
Open main.cpp file. Click the create a launch.json file link in the Run and Debug view. Click "Add Configuration..." button in the bottom right, select "C/C++: (gdb) launch". Edit and add the following entries:
```json
"program": "${workspaceFolder}/a.out",
"miDebuggerPath": "${env:ANDROID_NDK}/prebuilt/linux-x86_64/bin/gdb",
"miDebuggerServerAddress": "localhost:5039",
```

### 4. Start gdbserver on android device
```bash
bash run_gdbserver.sh
```

### 5. Start debugging
Set a breakpoint in main.cpp and press F5.