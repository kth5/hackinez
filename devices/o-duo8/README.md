## O+Duo 8" 

```
dual-OS tablet
1280x800 IPS diplay
64GB Storage
Micro-SD
```

Goal is to install a regular GNU/Linux distro on this thing potentially hijacking the bootprocess for the Android already installed.

## Bootloader

Seems to use InsydeQ2S for OS switching, hints at EFI firmware/bootloader. Yet to be confirmed.

## CPU is a quad-core:
```
vendor_id	: GenuineIntel
cpu family	: 6
model		: 55
model name	: Intel(R) Atom(TM) CPU  Z3735F @ 1.33GHz
stepping	: 8
cpu MHz		: 1333.000
cache size	: 1024 KB
physical id	: 0
siblings	: 4
core id		: 0
cpu cores	: 2
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 11
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 movbe popcnt aes rdrand lahf_lm ida arat epb dtherm tsc_adjust smep erms
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:
```

## Wifi Chipset

Realtek RTL8723BS LAN 802.11n SDIO 2.4Ghz only

Interesting reads:
http://ubuntuforums.org/showthread.php?t=2249936

## Partition table:
```
KBytes   dev  (desc)

60416000 sda
  262144 sda1 (log? ext4)
   32768 sda2 (data; L10N & animations?) 
  131072 sda3 (? ext4)
   65536 sda4 (Windows BOOT vfat)
   32768 sda5
   16384 sda6 (Android bootimg [1])
   16384 sda7 (Android bootimg [1] backup?)
    1024 sda8
    1024 sda9
    8192 sda10
  917504 sda11 (Backup ext4)
 2097152 sda12 (Android Apps ext4)
16777216 sda13 (Android rootfs?)
  131072 sda14
39462912 sda15 (Windows C:\ ntfs)
  460800 sdb   (MicroSD slot)
```

[1] Android bootimg, kernel (0x10008000), ramdisk (0x11000000), page size: 2048, cmdline (console=ttyS0,115200 console=logk0 earlyprintk=nologger ptrace.)
