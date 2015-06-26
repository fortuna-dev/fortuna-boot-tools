# fortuna-boot-tools
Pack and unpack boot.img or recovery.img
source code from: 
* https://github.com/CyanogenMod/android_device_qcom_common/tree/cm-12.1/dtbtool
* https://github.com/CyanogenMod/android_system_core/tree/cm-12.1/cpio/mkbootfs.c
* https://github.com/CyanogenMod/android_system_core/tree/cm-12.1/mkbootimg
* https://github.com/CyanogenMod/android_system_core/tree/cm-12.1/libmincrypt
* https://github.com/CyanogenMod/android_system_core/tree/cm-12.1/include/mincrypt
* https://github.com/CyanogenMod/android_system_core/tree/cm-12.1/include/private/android_filesystem_capability.h
* https://github.com/CyanogenMod/android_system_core/tree/cm-12.1/include/private/android_filesystem_config.h

### build
```
$ make 
```
### clean build
```
$ make clean
```

### SetUp in Linux
```
$ sudo cp ~/mkbootimg /bin/mkbootimg
$ sudo cp ~/unpackbootimg /bin/unpackbootimg
$ sudo chmod 755 /bin/mkbootimg
$ sudo chmod 755 /bin/unpackbootimg
```

### unpack boot.img or recovery.img
```
$ unpackbootimg
            -i|--input boot.img
            [ -o|--output output_directory]
            [ -p|--pagesize <size-in-hexadecimal> ]
```

### pack boot.img or recovery.img
```
$ mkbootimg
            --kernel <filename>
            --ramdisk <filename>
            [ --second <2ndbootloader-filename> ]
            [ --cmdline <kernel-commandline> ]
            [ --board <boardname> ]
            [ --base <address> ]
            [ --pagesize <pagesize> ]
            [ --dt <filename> ]
            [ --ramdisk_offset <address> ]
            [ --tags_offset <address> ]
            -o|--output <filename>
```
