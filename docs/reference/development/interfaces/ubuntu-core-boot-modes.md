(interfaces-ubuntu-core-boot-modes)=
# ubuntu-core-boot-modes

On an [Ubuntu Core](https://ubuntu.com/core) system, when a new [kernel snap](/) or *core* snap environment is installed, Ubuntu Core enables a special boot mode called *try*.

If the system fails to boot, *try* boot mode allows the system to revert automatically to a last known good core and kernel combination 

## Details

The implementation of *try-boot* touches both snapd and the bootloader (`grub/uboot/aboot`) in the following ways:

1. By default, `snap_mode` is `""`, in which case the bootloader loads   loads two squashfs files denoted by variables `snap_core` and `snap_kernel`.
1. When a core/kernel snap is refreshed, snapd will set both `snap_mode=try` and `snap_try_{core,kernel}` to the core/kernel that  will be tried next.
1. On reboot, the bootloader will inspect *snap_mode* and, if it's set to `try`, will set `snap_mode=trying` and attempt to boot the `snap_try_{core,kernel}`.
1. On a **successful boot**, snapd resets *snap_mode* to `""` and copies `snap_try_{core,kernel}` to `snap_{core,kernel}`. The *snap_try_/** values are cleared afterwards. The bootmode is now in *state(1)* again.
1. On a **failing boot**, the bootloader will see `snap_mode=trying` which means snapd did not start successfully. In this, case the bootloader will set `snap_mode=""` and the system will boot with the known good values from `snap_{core,kernel}`. The bootmode is in *state(1)* again.

