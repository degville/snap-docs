(reference-operations-interfaces-super-privileged-interfaces)=
# Super-privileged interfaces

[Interfaces](/explanation/interfaces/all-about-interfaces) allow (or deny) access to a resource outside of a snap’s confinement and, generally, any snap can declare any [supported interface](/reference/operations/interfaces/index).

However, there is a limited set of interfaces that require extra scrutiny when their _plugs_ are included in a snap. This is due to their permissive nature and the control and impact they potentially have over a system.

These interfaces are called **super-privileged**, and snaps that include plugs for super-privileged interfaces require specific [approval from the Store](https://forum.snapcraft.io/t/process-for-aliases-auto-connections-and-tracks/455) before they can be distributed and installed.


## Super-privileged interfaces

|Interface | Description | Categories | Auto-connect|
|--- | --- | --- | ---|
|[auditd-support](/) | permits snaps to operate as auditd service | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces) | no|
|[block-devices](/) | access to disk block devices | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Storage, Low level | no|
|[classic-support](/) | enable resource access to classic snap | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Ubuntu Core | no|
|[custom-device](/) | permits access to a specific class of device | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Ubuntu Core | no|
|[desktop-launch](/) | identify and launch desktop apps from other snaps | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Desktop | no|
|[dm-crypt](/) | access encrypted storage devices | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Ubuntu Core, Storage | no|
|[docker](/) | start, stop, or manage Docker containers | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Containers | no|
|[docker-support](/) | allows operating as the Docker daemon | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Containers | no|
|[gpio-control](/) | allows to export/unexport and control all GPIOs | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), GPIO | no|
|[greengrass-support](/) | allows operating as the Greengrass service | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Edge, AWS, Discrete | no|
|[ion-memory-control](/) | access Android's ION memory allocator | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), [System](/reference/operations/interfaces/system-interfaces) | no|
|[kernel-firmware-control](/) | permits a custom kernel firmware search path | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces) | no|
|[kernel-module-control](/) | insert, remove and query kernel modules | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), [System](/reference/operations/interfaces/system-interfaces), Kernel | no|
|[kernel-module-load](/) | load, or deny loading, specific kernel modules | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), [System](/reference/operations/interfaces/system-interfaces), Kernel | no|
|[kubernetes-support](/) | use functions essential for Kubernetes | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Hypervisor, Discrete | no|
|[lxd](/) | provides access to the LXD socket | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Container, Discrete | no|
|[lxd-support](/) | allows operating as the LXD service | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Container, Discrete | no|
|[microceph](/) | permits access to the MicroCeph socket, which is used internally by the microceph snap | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Container | no|
|[microceph_support](/) | permits the microceph snap to operate as the MicroCeph service | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Container | no|
|[microovn](/) | used only by the MicroOVN snap for socket access | [Network](/reference/operations/interfaces/network-interfaces), [Super privileged](/reference/operations/interfaces/super-privileged-interfaces) | no|
|[microstack-support](/t/the-microstack-support-interface/26505/) | multiple service access to the Microstack infrastructure | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Container, Discrete | no|
|[mount-control](/) | mount and unmount transient and persistent filesystem mount points | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Storage | no|
|[multipass-support](/) | multipass-support allows operating as the Multipass service | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), VM, Discrete | no|
|[nvidia-drivers-support](/) | internally used NVIDIA access | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Ubuntu Core | no|
|[packagekit-control](/) | control the PackageKit service | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Packaging | no|
|[personal-files](/) | read or write files in the user's home directory | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Personal data, Attributes | no|
|[pkcs11](/) | enables the cryptographic token interface standard to be used | [Security](/reference/operations/interfaces/security-interfaces), [Super privileged](/reference/operations/interfaces/super-privileged-interfaces) | no|
|[polkit](/) | access to the polkit authorisation manager | [Security](/reference/operations/interfaces/security-interfaces), [System](/reference/operations/interfaces/system-interfaces), [Super privileged](/reference/operations/interfaces/super-privileged-interfaces) | no|
|[polkit-agent](/) | permits applications to register as _polkit_ agents | [Security](/reference/operations/interfaces/security-interfaces), [System](/reference/operations/interfaces/system-interfaces), [Super privileged](/reference/operations/interfaces/super-privileged-interfaces) | no|
|[posix-mq](/) | enables inter-process communication (IPC) messages | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), IPC | no by default, yes with snaps from the same publisher|
|[remoteproc](/) | interact with the kernel's Remote Processor Framework | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces) | no|
|[scsi-generic](/) | read and write access to SCSI Generic driver devices | Storage, [Super privileged](/reference/operations/interfaces/super-privileged-interfaces) | no|
|[sd-control](/) | control SD cards on specific devices | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Storage | no|
|[shared-memory](/) | enables two snaps to access the same shared memory | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), IPC | no|
|[snap-refresh-control](/) | permits bespoke snap refresh control | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Packaging | no|
|[snap-refresh-observe](/) | enables the tracking of snap refreshes | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Packaging | no|
|[snapd-control](/) | install or remove software | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Packaging | no|
|[steam-support](/) | allows the Steam snap to access pressure-vessel containers | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Discrete | no|
|[shutdown](/) | restart or power off the device | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), [System](/reference/operations/interfaces/system-interfaces), Power | no|
|[system-files](/) | read or write files in the system | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Storage, Attributes | no|
|[tee](/) | permits access to the Trusted Execution Environment | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Security, Ubuntu Core | no|
|[uinput](/) | allows write access to /dev/uinput | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces), Hardware | no|
|[unity8](/) | share data with other Unity 8 apps | Display, [Super privileged](/reference/operations/interfaces/super-privileged-interfaces) | yes|
|[userns](/) | permits a snap to create a new namespace | [Super privileged](/reference/operations/interfaces/super-privileged-interfaces) | no|
|[xilinx-dma](/) | allows access to Xilinx DMA IP from a connected PCIe card | Ubuntu Core, [Super privileged](/reference/operations/interfaces/super-privileged-interfaces) | no|

