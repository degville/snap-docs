(snap-reference-operations-interfaces-index)=
# Interfaces

[Interfaces](/snap-explanation/interfaces/all-about-interfaces) enable resources from one snap to be shared with another and with the system. The table below lists currently supported interfaces, with links to further details for each interface.

The following column names are used:

- **Interface** is the syntactical interface name, as used by snaps.

- **Description** is a brief overview of what the interface permits. Select the interface name to open the interface-specific page for a more detailed description on each interface.

- **Categories** are used to split interfaces into broad types, and also to indicate what kind of access they permit. Video, graphics and audio are typical desktop requirements, for example, while VM, Container, Kernel and Developer imply more specific roles. The Ubuntu Core category is used to denote when an interface is intended for [Ubuntu Core](https://forum.snapcraft.io/t/glossary/14612#heading--ubuntu-core), and _Super privileged_ is used when an interface requires extra security scrutiny. See [Super-privileged interfaces](/snap-reference/operations/interfaces/super-privileged-interfaces) for more information.

- **Auto-connect** indicates that the interface will be connected by default when the snap is first installed, requiring no further user action. If `Auto-connect=no`, an interface can still be automatically connected if the snap developer has requested, and been granted, explicit permission. See [Interface connection mechanism](/snap-explanation/interfaces/interface-auto-connection) for details.

---

| Interface | Description | Categories | Auto-connect |
|---|----|---|---|
| [account-control](/) | add/remove user accounts or change passwords | [System](/snap-reference/operations/interfaces/system-interfaces), Account | no |
| [accounts-service](/) | allows communication with the accounts service | [System](/snap-reference/operations/interfaces/system-interfaces), Account | no |
| [acrn](/) | allows access to user VMs using the ACRN hypervisor | VM, Hypervisor, Developer | no |
| [adb-support](/) | allows operating as Android Debug Bridge service | ADB, Developer | no |
| [allegro-vcu](/) | access the Allegro Video Core Unit | Video, Graphics | no |
| [alsa](/) | play or record sound | Audio, [Media](/snap-reference/operations/interfaces/media-interfaces) | no |
| [appstream-metadata](/) | allows access to AppStream metadata | [System](/snap-reference/operations/interfaces/system-interfaces), Developer, Manage software | no |
| [audio-playback](/) | allows audio playback via supporting services | Audio, [Media](/snap-reference/operations/interfaces/media-interfaces), Playback | yes |
| [audio-record](/) | allows audio recording via supported services | Audio, [Media](/snap-reference/operations/interfaces/media-interfaces), Record | no |
| [autopilot-introspection](/) | be controlled by Autopilot software | [System](/snap-reference/operations/interfaces/system-interfaces), Developer | no |
| [avahi-control](/) | advertise services over the local network | [Network](/snap-reference/operations/interfaces/network-interfaces), Local network, Nearby devices | no |
| [avahi-observe](/) | detect services and devices over the local network | [Network](/snap-reference/operations/interfaces/network-interfaces), Local network, Nearby devices | no |
| [block-devices](/) | access to disk block devices | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Storage, Low level | no |
| [bluetooth-control](/) | access Bluetooth hardware directly | [Network](/snap-reference/operations/interfaces/network-interfaces), Bluetooth, Nearby devices | no |
| [bluez](/) | use Bluetooth devices | [Network](/snap-reference/operations/interfaces/network-interfaces), Bluetooth, Nearby devices | no |
| [bool-file](/) | allows access to specific file with bool semantics | [System](/snap-reference/operations/interfaces/system-interfaces), Low level, Privileged | no |
| [broadcom-asic-control](/) | control Broadcom network switches | [Network](/snap-reference/operations/interfaces/network-interfaces), [System](/snap-reference/operations/interfaces/system-interfaces) | no |
| [browser-support](/) | use functions essential for Web browsers | Browser, [Network](/snap-reference/operations/interfaces/network-interfaces) | no when allow-sandbox: true, yes otherwise |
| [calendar-services](/) | allows communication with Evolution Data Server calendar | Personal data, Contacts and calendar | no |
| [camera](/) | use your camera or webcam | Camera, [Media](/snap-reference/operations/interfaces/media-interfaces), Personal data | no |
| [can-bus](/) | allows access to the CAN bus | [System](/snap-reference/operations/interfaces/system-interfaces), Developer | no |
| [cifs-mount](/) | allows the mounting and unmounting of CIFS filesystems | [Network](/snap-reference/operations/interfaces/network-interfaces),Storage | no |
| [classic-support](/) | enable resource access to classic snap | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Ubuntu Core | no |
| [confdb](/) | permit access confdb configuration system | System | no |
| [contacts-service](/) | allows communication with the Evolution Data Server address book | Personal data, Contacts and calendar| no |
| [content](/) | access resources across snaps | Storage, Files, Attributes | yes for snaps from same publisher, no otherwise |
| [core-support](/) | deprecated since snap 2.34 | [System](/snap-reference/operations/interfaces/system-interfaces), Other | no |
| [cpu-control](/) | set certain CPU values | [System](/snap-reference/operations/interfaces/system-interfaces), Developer | no |
| [cups](/) | access to the CUPS socket for printing | Printing | not applicable |
| [cups-control](/) | print documents | Printing | no |
| [custom-device](/) | permits access to a specific class of device | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Ubuntu Core | no |
| [daemon-notify](/) | allows sending daemon status changes to service manager | [System](/snap-reference/operations/interfaces/system-interfaces), Developer | no |
| [dbus](/) | allow snaps to communicate over D-Bus | [System](/snap-reference/operations/interfaces/system-interfaces), Developer | no |
| [dcdbas-control](/) | shut down or restart Dell devices | Developer | no |
| [desktop](/) | provides access to common desktop elements | Desktop | yes |
| [desktop-launch](/) | identify and launch desktop apps from other snaps | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Desktop | no |
| [desktop-legacy](/) | enables the use of legacy desktop methods (including input method and accessibility services) | Desktop | yes |
| [device-buttons](/) | use any device-buttons | [Hardware](/snap-reference/operations/interfaces/hardware-interfaces), Developer | no |
| [display-control](/) | allows configuring display parameters | Display, Graphics | no |
| [dm-crypt](/) | access encrypted storage devices | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Ubuntu Core, Storage | no |
| [docker](/) | start, stop, or manage Docker containers | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Containers | no |
| [docker-support](/) | allows operating as the Docker daemon | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Containers | no |
| [dsp](/) | enables the control of digital signal processors (DSPs) | [Hardware](/snap-reference/operations/interfaces/hardware-interfaces), Developer | no |
| [dummy](/) | renamed to empty interface | [System](/snap-reference/operations/interfaces/system-interfaces), Other | no |
| [dvb](/) | allows access to all DVB devices and APIs | [Hardware](/snap-reference/operations/interfaces/hardware-interfaces), Developer, [Media](/snap-reference/operations/interfaces/media-interfaces) | no |
| [empty](/) | allows testing without additional permissions | [System](/snap-reference/operations/interfaces/system-interfaces), Other | no |
| [firewall-control](/) | configure a network firewall | [Network](/snap-reference/operations/interfaces/network-interfaces) | no |
| [fpga](/) | permits access to an FPGA subsystem | [Hardware](/snap-reference/operations/interfaces/hardware-interfaces), Developer | no |
| [framebuffer](/) | access to universal framebuffer devices | [Hardware](/snap-reference/operations/interfaces/hardware-interfaces), Developer | no |
| [fuse-support](/) | enables access to the FUSE filesystems | Storage | no |
| [fwupd](/) | allows operating as the fwupd service | [System](/snap-reference/operations/interfaces/system-interfaces), [Security](/snap-reference/operations/interfaces/security-interfaces), Firmware | no |
| [gconf](/) | access the legacy GConf config system | [System](/snap-reference/operations/interfaces/system-interfaces), Developer, Settings | no |
| [gpg-keys](/) | read GPG user configuration and keys | GPG, Personal data, [Security](/snap-reference/operations/interfaces/security-interfaces) | no |
| [gpg-public-keys](/) | read GPG non-sensitive configuration and public keys | GPG, Personal data, [Security](/snap-reference/operations/interfaces/security-interfaces) | no |
| [gpio](/) | access specific GPIO pins | GPIO, [Hardware](/snap-reference/operations/interfaces/hardware-interfaces), Developer | no |
| [gpio-control](/) | allows to export/unexport and control all GPIOs | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), GPIO | no |
| [gpio-memory-control](/) | allows write access to all GPIO memory | GPIO, [Hardware](/snap-reference/operations/interfaces/hardware-interfaces), Developer | no |
| [greengrass-support](/) | allows operating as the Greengrass service | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Edge, AWS, Discrete | no |
| [gsettings](/) | provides access to any GSettings item for current user | [System](/snap-reference/operations/interfaces/system-interfaces), Developer, Settings | yes |
| [hardware-observe](/) | access hardware information | [System](/snap-reference/operations/interfaces/system-interfaces), [Hardware](/snap-reference/operations/interfaces/hardware-interfaces) | no |
| [hardware-random-control](/) | provide entropy to hardware random number generator | [System](/snap-reference/operations/interfaces/system-interfaces), [Hardware](/snap-reference/operations/interfaces/hardware-interfaces) | no |
| [hardware-random-observe](/) | use hardware-generated random numbers | [System](/snap-reference/operations/interfaces/system-interfaces), [Hardware](/snap-reference/operations/interfaces/hardware-interfaces) | no |
| [hidraw](/) | access hidraw devices | [System](/snap-reference/operations/interfaces/system-interfaces) | no |
| [home](/) | access non-hidden files in the home directory | Storage, Personal data | yes on classic (traditional distributions), no otherwise |
| [hostname-control](/) | allows configuring the system hostname | [Network](/snap-reference/operations/interfaces/network-interfaces) | no |
| [hugepages-control](/) | control HugePages memory blocks | [System](/snap-reference/operations/interfaces/system-interfaces), Memory, Kernel | no |
| [i2c](/) | access i²c devices | [System](/snap-reference/operations/interfaces/system-interfaces), [Hardware](/snap-reference/operations/interfaces/hardware-interfaces) | no |
| [iio](/) | access IIO devices | [System](/snap-reference/operations/interfaces/system-interfaces), [Hardware](/snap-reference/operations/interfaces/hardware-interfaces) | no |
| [intel-mei](/) | access to the Intel MEI management interface | [System](/snap-reference/operations/interfaces/system-interfaces), Firmware | no |
| [intel-qat](/) | provides permissions for Intel QAT devices | [Hardware](/snap-reference/operations/interfaces/hardware-interfaces) | no  | 
| [io-ports-control](/) | allows access to all I/O ports | [System](/snap-reference/operations/interfaces/system-interfaces), | no |
| [ion-memory-control](/) | access Android's ION memory allocator | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), [System](/snap-reference/operations/interfaces/system-interfaces)  | no |
| [jack1](/) | allows interaction with the JACK audio connection server | Audio, [Media](/snap-reference/operations/interfaces/media-interfaces) | no |
| [joystick](/) | use any connected joystick | [Hardware](/snap-reference/operations/interfaces/hardware-interfaces), Developer | no |
| [juju-client-observe](/) | read the Juju client configuration | Developer, Discrete | no |
| [kernel-crypto-api](/) | read and manage kernel supported crypto ciphers | [System](/snap-reference/operations/interfaces/system-interfaces), Kernel, [Security](/snap-reference/operations/interfaces/security-interfaces) | no |
| [kernel-firmware-control](/) | permits a custom kernel firmware search path | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces) | no |
| [kernel-module-control](/) | insert, remove and query kernel modules | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), [System](/snap-reference/operations/interfaces/system-interfaces), Kernel | no |
| [kernel-module-load](/) | load, or deny loading, specific kernel modules | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), [System](/snap-reference/operations/interfaces/system-interfaces), Kernel | no |
| [kernel-module-observe](/) | query kernel modules | [System](/snap-reference/operations/interfaces/system-interfaces), Kernel | no |
| [kubernetes-support](/) | use functions essential for Kubernetes | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Hypervisor, Discrete | no |
| [kvm](/) | allows access to the kvm device | VM, Hypervisor, Developer | no |
| [libvirt](/) | provides access to the libvirt service | VM, Hypervisor, Developer | no |
| [locale-control](/) | change system language and region settings | Language and region, Personalisation | no |
| [location-control](/) | allows operating as the location service | Location | no |
| [location-observe](/) | access your location | Location | no |
| [log-observe](/) | read system logs | [System](/snap-reference/operations/interfaces/system-interfaces), Developer | no |
| [login-session-control](/) | allows setup of login sessions and grants privileged access to user sessions | [System](/snap-reference/operations/interfaces/system-interfaces), [Security](/snap-reference/operations/interfaces/security-interfaces) | no |
| [login-session-observe](/) | allows reading login and session information | [System](/snap-reference/operations/interfaces/system-interfaces), [Security](/snap-reference/operations/interfaces/security-interfaces) | no |
| [lxd](/) | provides access to the LXD socket | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Container, Discrete | no |
| [lxd-support](/) | allows operating as the LXD service | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Container, Discrete | no |
| [maliit](/) | use an on-screen keyboard | Developer | no |
| [media-control](/t/the-media-control-interface/26504/) | access media control devices and Video4Linux (V4L) devices | [Hardware](/snap-reference/operations/interfaces/hardware-interfaces), Developer, [Media](/snap-reference/operations/interfaces/media-interfaces), Video | no |
| [media-hub](/) | access snaps providing the media-hub interface | Developer, [Media](/snap-reference/operations/interfaces/media-interfaces) | yes |
|  [microceph](/) |  permits access to the MicroCeph socket, which is used internally by the microceph snap | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Container | no |
| [microceph-support](/) | permits the microceph snap to operate as the MicroCeph service | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Container | no |
| [microovn](/) | used only by the MicroOVN snap for socket access | [Network](/snap-reference/operations/interfaces/network-interfaces), [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces) | no |
| [microstack-support](/t/the-microstack-support-interface/26505/) | multiple service access to the Microstack infrastructure | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Container, Discrete | no |
| [mir](/) | enables access to the Mir display service | Display | yes |
| [modem-manager](/) | use and configure modems | [Network](/snap-reference/operations/interfaces/network-interfaces) | no |
| [mount-control](/) | mount and unmount transient and persistent filesystem mount points | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Storage | no |
| [mount-observe](/) | read mount table and quota information | Storage | no |
| [mpris](/) | media key control of music and video players | Sound | no |
| [multipass-support](/) | multipass-support allows operating as the Multipass service | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), VM, Discrete | no |
| [netlink-audit](/) | allows access to kernel audit system through Netlink | Inter-process communication (IPC), Netlink, Developer | no |
| [netlink-connector](/) | communicate through the kernel Netlink connector | Inter-process communication (IPC), Netlink, Developer | no |
| [netlink-driver](/) | operate a kernel driver module exposed via Netlink | Inter-process communication (IPC), Netlink, Developer | no |
| [network](/) | enables network access | [Network](/snap-reference/operations/interfaces/network-interfaces) | yes |
| [network-bind](/) | operate as a network service | [Network](/snap-reference/operations/interfaces/network-interfaces) | yes |
| [network-control](/) | change low-level network settings | [Network](/snap-reference/operations/interfaces/network-interfaces) | no |
| [network-manager](/) | configure and observe networking via NetworkManager | [Network](/snap-reference/operations/interfaces/network-interfaces) | no |
| [network-manager-observe](/) | allows observing NetworkManager settings | [Network](/snap-reference/operations/interfaces/network-interfaces) | no |
| [network-observe](/) | query network status information | [Network](/snap-reference/operations/interfaces/network-interfaces) | no |
| [network-setup-control](/) | change network settings via Netplan | [Network](/snap-reference/operations/interfaces/network-interfaces) | no |
| [network-setup-observe](/) | read network settings | [Network](/snap-reference/operations/interfaces/network-interfaces) | no |
| [network-status](/) | access the [Network](/snap-reference/operations/interfaces/network-interfaces)Status service | [Network](/snap-reference/operations/interfaces/network-interfaces) | yes |
| [nfs-mount](/) | allows the mounting and unmounting of Network File System mount points | [Network](/snap-reference/operations/interfaces/network-interfaces), Service | no |
| [nomad-support](/) |  enable's HashiCorp's Nomad to access CPU and memory management | [System](/snap-reference/operations/interfaces/system-interfaces), Containers, Service | no |
| [nvidia-drivers-support](/) | internally used NVIDIA access | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Ubuntu Core | no |
| [ofono](/) | allows operating as the oFono service | [Network](/snap-reference/operations/interfaces/network-interfaces), Discrete, Developer | no |
| [online-accounts-service](/) | access to the Online Accounts service | Service, Developer | yes |
| [opengl](/) | access OpenGL/GPU hardware | Display, Graphics | yes |
| [openvswitch](/) | control Open vSwitch hardware | [Network](/snap-reference/operations/interfaces/network-interfaces), Service, Developer | no |
| [openvswitch-support](/) | enables kernel support for Open vSwitch | [Network](/snap-reference/operations/interfaces/network-interfaces), Service, Developer | no |
| [optical-drive](/) | read/write access to CD/DVD drives | Storage, [Hardware](/snap-reference/operations/interfaces/hardware-interfaces), Developer | yes, unless drive can write |
| [packagekit-control](/) | control the PackageKit service | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Packaging | no |
| [password-manager-service](/) | read, add, change, or remove saved passwords | [System](/snap-reference/operations/interfaces/system-interfaces), [Security](/snap-reference/operations/interfaces/security-interfaces) | no |
| [pcscd](/) | permits communication with PCSD smart card daemon | [Security](/snap-reference/operations/interfaces/security-interfaces) | no |
| [personal-files](/) | read or write files in the user's home directory | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Personal data, Attributes | no |
| [physical-memory-control](/) | read and write memory used by any process | [System](/snap-reference/operations/interfaces/system-interfaces), Memory, Kernel | no |
| [physical-memory-observe](/) | read memory used by any process | [System](/snap-reference/operations/interfaces/system-interfaces), Memory, Kernel | no |
| [pipewire](/) | access the PipeWire server | Audio, [Media](/snap-reference/operations/interfaces/media-interfaces), Video | no |
| [pkcs11](/) |  enables the cryptographic token interface standard to be used | [Security](/snap-reference/operations/interfaces/security-interfaces), [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces) | no |
| [polkit](/) | access to the polkit authorisation manager | [Security](/snap-reference/operations/interfaces/security-interfaces), [System](/snap-reference/operations/interfaces/system-interfaces), [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces) | no |
| [polkit-agent](/) | permits applications to register as _polkit_ agents | [Security](/snap-reference/operations/interfaces/security-interfaces), [System](/snap-reference/operations/interfaces/system-interfaces), [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces) | no |
| [posix-mq](/) | enables inter-process communication (IPC) messages | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), IPC | no by default, yes with snaps from the same publisher |
| [power-control](/) | read and write system power settings | [System](/snap-reference/operations/interfaces/system-interfaces), Power | no |
| [ppp](/) | access to configure and observe PPP networking | [Network](/snap-reference/operations/interfaces/network-interfaces) | no |
| [process-control](/) | pause or end any process on the system | [System](/snap-reference/operations/interfaces/system-interfaces) | no |
| [ptp](/) | access to the Precision Time Protocol subsystem | [System](/snap-reference/operations/interfaces/system-interfaces), Developer | no |
| [pulseaudio](/) | play and record sound | Audio, [Media](/snap-reference/operations/interfaces/media-interfaces) | no |
| [pwm](/) | access specific PWM channels | [System](/snap-reference/operations/interfaces/system-interfaces), Developer, [Hardware](/snap-reference/operations/interfaces/hardware-interfaces), WIP | no |
| [qualcomm-ipc-router](/) | access Qualcomm IPC router sockets | IPC, Kernel, [System](/snap-reference/operations/interfaces/system-interfaces) | no |
| [raw-input](/) | access raw input devices directly | [System](/snap-reference/operations/interfaces/system-interfaces), Developer, [Hardware](/snap-reference/operations/interfaces/hardware-interfaces) | no |
| [raw-usb](/) | access USB hardware directly | [System](/snap-reference/operations/interfaces/system-interfaces), Developer, [Hardware](/snap-reference/operations/interfaces/hardware-interfaces) | no |
| [raw-volume](/) | access specific disk partitions | Storage | no |
| [remoteproc](/) | interact with the kernel's Remote Processor Framework  |[Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces) | no |
| [ros-opt-data](/) | read-only access to ROS directories | Storage | no |
| [ros-snapd-support](/) | allows the snaps ros-snapd and ros2-snapd the use of snapd’s apps control API | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces) | no |
| [removable-media](/) | read/write files on removable storage devices | Storage | no |
| [screencast-legacy](/) | allows screen recording and audio recording alongside writing to arbitrary filesystem paths | Legacy | no |
| [screen-inhibit-control](/) | prevent screen sleep, lock and screensaver | Display | yes |
| [scsi-generic](/) | read and write access to SCSI Generic driver devices | Storage, [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces) | no |
| [sd-control](/) | control SD cards on specific devices | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Storage | no |
| [serial-port](/) | access serial port hardware | [System](/snap-reference/operations/interfaces/system-interfaces), Developer, [Hardware](/snap-reference/operations/interfaces/hardware-interfaces) | no |
| [shared-memory](/) | enables two snaps to access the same shared memory | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), IPC | no by default, yes with snaps from the same publisher |
| [shutdown](/) | restart or power off the device | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), [System](/snap-reference/operations/interfaces/system-interfaces), Power | no |
| [snap_interfaces_requests_control](/) | enables the prompting API and its access to prompting-related notice types | [System](/snap-reference/operations/interfaces/system-interfaces) | no |
| [snap-refresh-control](/) | permits bespoke snap refresh control | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Packaging | no |
| [snap-refresh-observe](/) | enables the tracking of snap refreshes | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Packaging | no |
| [snapd-control](/) | install or remove software | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Packaging | no |
| [spi](/) | access specific SPI devices | [System](/snap-reference/operations/interfaces/system-interfaces), Developer, [Hardware](/snap-reference/operations/interfaces/hardware-interfaces) | no |
| [ssh-keys](/) | access SSH private and public keys | [Security](/snap-reference/operations/interfaces/security-interfaces) | no |
| [ssh-public-keys](/) | access SSH public keys | [Security](/snap-reference/operations/interfaces/security-interfaces) | no |
| [steam-support](/) | allows the Steam snap to access pressure-vessel containers | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Discrete | no |
| [storage-framework-service](/) | operate as, or interact with, the Storage Framework | Storage | no |
| [system-backup](/) | read-only access to the system for backups | Storage | no |
| [system-files](/) | read or write files in the system | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), Storage, Attributes | no |
| [system-observe](/) | read process and system information | Monitoring, [System](/snap-reference/operations/interfaces/system-interfaces) | no |
| [system-packages-doc](/) | access system documentation in /usr/share/doc | Developer | no |
| [system-source-code](/) | access kernel source and headers in /usr/src | Developer | no |
| [system-trace](/) | monitor or control any running program | Monitoring, [System](/snap-reference/operations/interfaces/system-interfaces) | no |
| [tee](/) | permits access to the Trusted Execution Environment | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), [Security](/snap-reference/operations/interfaces/security-interfaces), Ubuntu Core | no |
| [thumbnailer-service](/) | create thumbnail images from local media files | Storage, [Media](/snap-reference/operations/interfaces/media-interfaces) | no |
| [time-control](/) | change the date and time | Time | no |
| [timeserver-control](/) | change time server settings | Time | no |
| [timezone-control](/) | change the time zone | Time | no |
| [tpm](/) | allows access to the Trusted Platform Module device | Kernel, [Security](/snap-reference/operations/interfaces/security-interfaces) | no |
| [u2f-devices](/t/the-u2f-devices-interface/9722/) | use any U2F devices | [Security](/snap-reference/operations/interfaces/security-interfaces), [Hardware](/snap-reference/operations/interfaces/hardware-interfaces), Developer | no |
| [ubuntu-download-manager](/) | use the Ubuntu Download Manager | [System](/snap-reference/operations/interfaces/system-interfaces), Developer, Manage software | yes |
| [udisks2](/) | access the UDisks2 service | Storage | no |
| [uhid](/) | create kernel UID devices from user-space | [Hardware](/snap-reference/operations/interfaces/hardware-interfaces), Kernel, [System](/snap-reference/operations/interfaces/system-interfaces) | no |
| [uinput](/) | allows write access to /dev/uinput | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces), [Hardware](/snap-reference/operations/interfaces/hardware-interfaces) | no |
| [uio](/) | access uio devices | [Hardware](/snap-reference/operations/interfaces/hardware-interfaces), [System](/snap-reference/operations/interfaces/system-interfaces) | no |
| [unity7](/) | access legacy desktop resources from Unity7 | Display | yes |
| [unity8](/) | share data with other Unity 8 apps | Display, [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces) | yes |
| [unity8-calendar](/) | read/change shared calendar events in Ubuntu Unity 8 | Personal data | no |
| [unity8-contacts](/) | read/change shared contacts in Ubuntu Unity 8 | Personal data | no |
| [upower-observe](/) | access battery level and power usage | [System](/snap-reference/operations/interfaces/system-interfaces), Power | yes |
| [userns](/) | permits a snap to create a new namespace | [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces) | no |
| [vcio](/) | access a Raspberry Pi's VideoCore multimedia processor | Video, Graphics, Ubuntu Core | no |
| [wayland](/) | access compositors providing the Wayland protocol | Display | yes |
| [x11](/) | monitor mouse/keyboard input and graphics output of other apps | Display | yes |
| [xilinx_dma](/) | allows access to Xilinx DMA IP from a connected PCIe card | Ubuntu Core, [Super privileged](/snap-reference/operations/interfaces/super-privileged-interfaces) | no |


```{toctree}
:hidden:
:titlesonly:
:maxdepth: 2
:glob:

*
*/index
