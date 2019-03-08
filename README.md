# PJSIP Android Builder
Easily build PJSIP with: OpenSSL, OpenH264, Opus and G.729 (without Intel IPP) for Android.

#### Purpose
I needed an easily replicable build system to build PJSIP http://www.pjsip.org/ native library with NDK for Android. 

## Prerequisite
- Run on Mac OS
- JAVA, GCC, PCRE, OPENSSL, AUTOCONF, AUTOMAKE, LIBTOOL, BZIP2
- GIT
- NASM

## Support - PJSIP 2.8
Using Android API `25`:
- Android NDK: `r13b`
- Android SDK: `r25.2.5`
- OpenSSL: `1.0.2.g` (The build script uses NDK `r12b` and Target SDK 23)
- SWIG: `3.0.12`

#### How to setup
1. Clone code from this repo
```
    git clone https://github.com/nguyenbinh12x/pjsip-android-builder.git
```
2. edit config file -> you can re-define your environment variable.
```
    editor pjsip-android-builder/config
```
3. run prepare build
```
    ./prepare-build
```
4. run build PJSIP
```
    ./build
```

#### Checking output logging
PJSIP output logging as below mention
```
 |-- output
    |-- patches/
    |-- openssl-build-output/
        |-- logs/
        |-- libs/
    |-- openh264-build-output/
        |-- logs/
        |-- libs/    
    |-- opus-build-output/
        |-- logs/
        |-- libs/
    |-- pjsip-build-output/
        |-- logs/
        |-- libs/
        |-- org/
            |-- pjsip/
                |-- pjsip2/
                    |-- app/
                |-- PjCamera.java
                |-- PjCameraInfo.java

```

#### References
```
[1]. https://trac.pjsip.org/repos/
[2]. https://trac.pjsip.org/repos/wiki/Getting-Started/Android
[3]. https://github.com/VoiSmart/pjsip-android-builder
[4]. https://en.wikipedia.org/wiki/Session_Initiation_Protocol
[5]. https://trac.pjsip.org/repos/wiki/TLS
[6]. https://www.tutorialspoint.com/session_initiation_protocol/index.htm
```

## About Project
    PJSIP Android Builder run on Mac Os
    Author: Aleksandar Gotev (alex.gotev@mobimesh.it) - VoiSmart Srl
    Modified by Binh Nguyen (nguyenbinh12x@gmail.com)

    Copyright (C) 2019

