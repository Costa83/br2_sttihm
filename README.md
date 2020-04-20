# br2_sttihm
Buildroot external for a bicycle dashboard

# How to use:
 1) download Buildroot in /opt
 2) start
``` shell
 $ export BR2_EXTERNAL=$PWD
 $ make O=$PWD/output raspberrypi3_defconfig
 $ cd output
 $ make menuconfig
 $ make
```

