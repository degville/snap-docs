(snap-reference-operations-interfaces-index)=
# Interfaces

[Interfaces](/explanation/interfaces/all-about-interfaces) enable resources from one snap to be shared with another and with the system. The table below lists currently supported interfaces, with links to further details for each interface.

The following column names are used:

- **Interface** is the syntactical interface name, as used by snaps.

- **Description** is a brief overview of what the interface permits. Select the interface name to open the interface-specific page for a more detailed description on each interface.

- **Categories** are used to split interfaces into broad types, and also to indicate what kind of access they permit. Video, graphics and audio are typical desktop requirements, for example, while VM, Container, Kernel and Developer imply more specific roles. The Ubuntu Core category is used to denote when an interface is intended for [Ubuntu Core](https://forum.snapcraft.io/t/glossary/14612#heading--ubuntu-core), and _Super privileged_ is used when an interface requires extra security scrutiny. See [Super-privileged interfaces](/snap-reference/operations/interfaces/super-privileged-interfaces) for more information.

- **Auto-connect** indicates that the interface will be connected by default when the snap is first installed, requiring no further user action. If `Auto-connect=no`, an interface can still be automatically connected if the snap developer has requested, and been granted, explicit permission. See [Interface connection mechanism](/explanation/interfaces/interface-auto-connection) for details.

---

| Interface | Description | Categories | Auto-connect |
|---|----|---|---|
| [account-control](interfaces/account-control-interface) | add/remove user accounts or change passwords | System, Account | no |
| [accounts-service](interfaces/accounts-service-interface) | allows communication with the accounts service | System, Account | no |
| [acrn](interfaces/acrn-interface) | allows access to user VMs using the ACRN hypervisor | VM, Hypervisor, Developer | no |
| [adb-support](interfaces/adb-support-interface) | allows operating as Android Debug Bridge service | ADB, Developer | no |
| [allegro-vcu](interfaces/allegro-vcu-interface) | access the Allegro Video Core Unit | Video, Graphics | no |
| [alsa](interfaces/alsa-interface) | play or record sound | Audio, Media | no |
| [appstream-metadata](interfaces/appstream-metadata-interface) | allows access to AppStream metadata | System, Developer, Manage software | no |
| [audio-playback](interfaces/audio-playback-interface) | allows audio playback via supporting services | Audio, Media, Playback | yes |
| [audio-record](interfaces/audio-record-interface) | allows audio recording via supported services | Audio, Media, Record | no |
| [autopilot-introspection](interfaces/autopilot-introspection-interface) | be controlled by Autopilot software | System, Developer | no |
| [avahi-control](interfaces/avahi-control-interface) | advertise services over the local network | Network, Local network, Nearby devices | no |
| [avahi-observe](interfaces/avahi-observe-interface) | detect services and devices over the local network | Network, Local network, Nearby devices | no |
| [block-devices](interfaces/block-devices-interface) | access to disk block devices | Super privileged, Storage, Low level | no |
| [bluetooth-control](interfaces/bluetooth-control-interface) | access Bluetooth hardware directly | Network, Bluetooth, Nearby devices | no |
| [bluez](interfaces/bluez-interface) | use Bluetooth devices | Network, Bluetooth, Nearby devices | no |
| [bool-file](interfaces/bool-file-interface) | allows access to specific file with bool semantics | System, Low level, Privileged | no |
| [broadcom-asic-control](interfaces/broadcom-asic-control-interface) | control Broadcom network switches | Network, System | no |
| [browser-support](interfaces/browser-support-interface) | use functions essential for Web browsers | Browser, Network | no when allow-sandbox: true, yes otherwise |
| [calendar-services](interfaces/calendar-services-interface) | allows communication with Evolution Data Server calendar | Personal data, Contacts and calendar | no |
| [camera](interfaces/camera-interface) | use your camera or webcam | Camera, Media, Personal data | no |
| [can-bus](interfaces/can-bus-interface) | allows access to the CAN bus | System, Developer | no |
| [cifs-mount](interfaces/cifs-mount-interface) | allows the mounting and unmounting of CIFS filesystems | Network,Storage | no |
| [classic-support](interfaces/classic-support-interface) | enable resource access to classic snap | Super privileged, Ubuntu Core | no |
| [confdb](interfaces/confdb-interface) | permit access confdb configuration system | System | no |
| [contacts-service](interfaces/contacts-service-interface) | allows communication with the Evolution Data Server address book | Personal data, Contacts and calendar| no |
| [content](interfaces/content-interface) | access resources across snaps | Storage, Files, Attributes | yes for snaps from same publisher, no otherwise |
| [core-support](interfaces/core-support-interface) | deprecated since snap 2.34 | System, Other | no |
| [cpu-control](interfaces/cpu-control-interface) | set certain CPU values | System, Developer | no |
| [cups](interfaces/cups-interface) | access to the CUPS socket for printing | Printing | not applicable |
| [cups-control](interfaces/cups-control-interface) | print documents | Printing | no |
| [custom-device](interfaces/custom-device-interface) | permits access to a specific class of device | Super privileged, Ubuntu Core | no |
| [daemon-notify](interfaces/daemon-notify-interface) | allows sending daemon status changes to service manager | System, Developer | no |
| [dbus](interfaces/dbus-interface) | allow snaps to communicate over D-Bus | System, Developer | no |
| [dcdbas-control](interfaces/dcdbas-control-interface) | shut down or restart Dell devices | Developer | no |
| [desktop](interfaces/desktop-interface) | provides access to common desktop elements | Desktop | yes |
| [desktop-launch](interfaces/desktop-launch-interface) | identify and launch desktop apps from other snaps | Super privileged, Desktop | no |
| [desktop-legacy](interfaces/desktop-legacy-interface) | enables the use of legacy desktop methods (including input method and accessibility services) | Desktop | yes |
| [device-buttons](interfaces/device-buttons-interface) | use any device-buttons | Hardware, Developer | no |
| [display-control](interfaces/display-control-interface) | allows configuring display parameters | Display, Graphics | no |
| [dm-crypt](interfaces/dm-crypt-interface) | access encrypted storage devices | Super privileged, Ubuntu Core, Storage | no |
| [docker](interfaces/docker-interface) | start, stop, or manage Docker containers | Super privileged, Containers | no |
| [docker-support](interfaces/docker-support-interface) | allows operating as the Docker daemon | Super privileged, Containers | no |
| [dsp](interfaces/dsp-interface) | enables the control of digital signal processors (DSPs) | Hardware, Developer | no |
| [dummy](interfaces/dummy-interface) | renamed to empty interface | System, Other | no |
| [dvb](interfaces/dvb-interface) | allows access to all DVB devices and APIs | Hardware, Developer, Media | no |
| [empty](interfaces/empty-interface) | allows testing without additional permissions | System, Other | no |
| [firewall-control](interfaces/firewall-control-interface) | configure a network firewall | Network | no |
| [fpga](interfaces/fpga-interface) | permits access to an FPGA subsystem | Hardware, Developer | no |
| [framebuffer](interfaces/framebuffer-interface) | access to universal framebuffer devices | Hardware, Developer | no |
| [fuse-support](interfaces/fuse-support-interface) | enables access to the FUSE filesystems | Storage | no |
| [fwupd](interfaces/fwupd-interface) | allows operating as the fwupd service | System, Security, Firmware | no |
| [gconf](interfaces/gconf-interface) | access the legacy GConf config system | System, Developer, Settings | no |
| [gpg-keys](interfaces/gpg-keys-interface) | read GPG user configuration and keys | GPG, Personal data, Security | no |
| [gpg-public-keys](interfaces/gpg-public-keys-interface) | read GPG non-sensitive configuration and public keys | GPG, Personal data, Security | no |
| [gpio](interfaces/gpio-interface) | access specific GPIO pins | GPIO, Hardware, Developer | no |
| [gpio-control](interfaces/gpio-control-interface) | allows to export/unexport and control all GPIOs | Super privileged, GPIO | no |
| [gpio-memory-control](interfaces/gpio-memory-control-interface) | allows write access to all GPIO memory | GPIO, Hardware, Developer | no |
| [greengrass-support](interfaces/greengrass-support-interface) | allows operating as the Greengrass service | Super privileged, Edge, AWS, Discrete | no |
| [gsettings](interfaces/gsettings-interface) | provides access to any GSettings item for current user | System, Developer, Settings | yes |
| [hardware-observe](interfaces/hardware-observe-interface) | access hardware information | System, Hardware | no |
| [hardware-random-control](interfaces/hardware-random-control-interface) | provide entropy to hardware random number generator | System, Hardware | no |
| [hardware-random-observe](interfaces/hardware-random-observe-interface) | use hardware-generated random numbers | System, Hardware | no |
| [hidraw](interfaces/hidraw-interface) | access hidraw devices | System | no |
| [home](interfaces/home-interface) | access non-hidden files in the home directory | Storage, Personal data | yes on classic (traditional distributions), no otherwise |
| [hostname-control](interfaces/hostname-control-interface) | allows configuring the system hostname | Network | no |
| [hugepages-control](interfaces/hugepages-control-interface) | control HugePages memory blocks | System, Memory, Kernel | no |
| [i2c](interfaces/i2c-interface) | access i²c devices | System, Hardware | no |
| [iio](interfaces/iio-interface) | access IIO devices | System, Hardware | no |
| [intel-mei](interfaces/intel-mei-interface) | access to the Intel MEI management interface | System, Firmware | no |
| [intel-qat](interfaces/intel-qat-interface) | provides permissions for Intel QAT devices | Hardware | no  | 
| [io-ports-control](interfaces/io-ports-control-interface) | allows access to all I/O ports | System, | no |
| [ion-memory-control](interfaces/ion-memory-control-interface) | access Android's ION memory allocator | Super privileged, System  | no |
| [jack1](interfaces/jack1-interface) | allows interaction with the JACK audio connection server | Audio, Media | no |
| [joystick](interfaces/joystick-interface) | use any connected joystick | Hardware, Developer | no |
| [juju-client-observe](interfaces/juju-client-observe-interface) | read the Juju client configuration | Developer, Discrete | no |
| [kernel-crypto-api](interfaces/kernel-crypto-api-interface) | read and manage kernel supported crypto ciphers | System, Kernel, Security | no |
| [kernel-firmware-control](interfaces/kernel-firmware-control-interface) | permits a custom kernel firmware search path | Super privileged | no |
| [kernel-module-control](interfaces/kernel-module-control-interface) | insert, remove and query kernel modules | Super privileged, System, Kernel | no |
| [kernel-module-load](interfaces/kernel-module-load-interface) | load, or deny loading, specific kernel modules | Super privileged, System, Kernel | no |
| [kernel-module-observe](interfaces/kernel-module-observe-interface) | query kernel modules | System, Kernel | no |
| [kubernetes-support](interfaces/kubernetes-support-interface) | use functions essential for Kubernetes | Super privileged, Hypervisor, Discrete | no |
| [kvm](interfaces/kvm-interface) | allows access to the kvm device | VM, Hypervisor, Developer | no |
| [libvirt](interfaces/libvirt-interface) | provides access to the libvirt service | VM, Hypervisor, Developer | no |
| [locale-control](interfaces/locale-control-interface) | change system language and region settings | Language and region, Personalisation | no |
| [location-control](interfaces/location-control-interface) | allows operating as the location service | Location | no |
| [location-observe](interfaces/location-observe-interface) | access your location | Location | no |
| [log-observe](interfaces/log-observe-interface) | read system logs | System, Developer | no |
| [login-session-control](interfaces/login-session-control-interface) | allows setup of login sessions and grants privileged access to user sessions | System, Security | no |
| [login-session-observe](interfaces/login-session-observe-interface) | allows reading login and session information | System, Security | no |
| [lxd](interfaces/lxd-interface) | provides access to the LXD socket | Super privileged, Container, Discrete | no |
| [lxd-support](interfaces/lxd-support-interface) | allows operating as the LXD service | Super privileged, Container, Discrete | no |
| [maliit](interfaces/maliit-interface) | use an on-screen keyboard | Developer | no |
| [media-control](interfaces/media-control-interface) | access media control devices and Video4Linux (V4L) devices | Hardware, Developer, Media, Video | no |
| [media-hub](interfaces/media-hub-interface) | access snaps providing the media-hub interface | Developer, Media | yes |
|  [microceph](interfaces/microceph-interface) |  permits access to the MicroCeph socket, which is used internally by the microceph snap | Super privileged, Container | no |
| [microceph-support](interfaces/microceph-support-interface) | permits the microceph snap to operate as the MicroCeph service | Super privileged, Container | no |
| [microovn](interfaces/microovn-interface) | used only by the MicroOVN snap for socket access | Network, Super privileged | no |
| [microstack-support](interfaces/microstack-support-interfacet/the-microstack-support-interface/26505/) | multiple service access to the Microstack infrastructure | Super privileged, Container, Discrete | no |
| [mir](interfaces/mir-interface) | enables access to the Mir display service | Display | yes |
| [modem-manager](interfaces/modem-manager-interface) | use and configure modems | Network | no |
| [mount-control](interfaces/mount-control-interface) | mount and unmount transient and persistent filesystem mount points | Super privileged, Storage | no |
| [mount-observe](interfaces/mount-observe-interface) | read mount table and quota information | Storage | no |
| [mpris](interfaces/mpris-interface) | media key control of music and video players | Sound | no |
| [multipass-support](interfaces/multipass-support-interface) | multipass-support allows operating as the Multipass service | Super privileged, VM, Discrete | no |
| [netlink-audit](interfaces/netlink-audit-interface) | allows access to kernel audit system through Netlink | Inter-process communication (IPC), Netlink, Developer | no |
| [netlink-connector](interfaces/netlink-connector-interface) | communicate through the kernel Netlink connector | Inter-process communication (IPC), Netlink, Developer | no |
| [netlink-driver](interfaces/netlink-driver-interface) | operate a kernel driver module exposed via Netlink | Inter-process communication (IPC), Netlink, Developer | no |
| [network](interfaces/network-interface) | enables network access | Network | yes |
| [network-bind](interfaces/network-bind-interface) | operate as a network service | Network | yes |
| [network-control](interfaces/network-control-interface) | change low-level network settings | Network | no |
| [network-manager](interfaces/network-manager-interface) | configure and observe networking via NetworkManager | Network | no |
| [network-manager-observe](interfaces/network-manager-observe-interface) | allows observing NetworkManager settings | Network | no |
| [network-observe](interfaces/network-observe-interface) | query network status information | Network | no |
| [network-setup-control](interfaces/network-setup-control-interface) | change network settings via Netplan | Network | no |
| [network-setup-observe](interfaces/network-setup-observe-interface) | read network settings | Network | no |
| [network-status](interfaces/network-status-interface) | access the NetworkStatus service | Network | yes |
| [nfs-mount](interfaces/nfs-mount-interface) | allows the mounting and unmounting of Network File System mount points | Network, Service | no |
| [nomad-support](interfaces/nomad-support-interface) |  enable's HashiCorp's Nomad to access CPU and memory management | System, Containers, Service | no |
| [nvidia-drivers-support](interfaces/nvidia-drivers-support-interface) | internally used NVIDIA access | Super privileged, Ubuntu Core | no |
| [ofono](interfaces/ofono-interface) | allows operating as the oFono service | Network, Discrete, Developer | no |
| [online-accounts-service](interfaces/online-accounts-service-interface) | access to the Online Accounts service | Service, Developer | yes |
| [opengl](interfaces/opengl-interface) | access OpenGL/GPU hardware | Display, Graphics | yes |
| [openvswitch](interfaces/openvswitch-interface) | control Open vSwitch hardware | Network, Service, Developer | no |
| [openvswitch-support](interfaces/openvswitch-support-interface) | enables kernel support for Open vSwitch | Network, Service, Developer | no |
| [optical-drive](interfaces/optical-drive-interface) | read/write access to CD/DVD drives | Storage, Hardware, Developer | yes, unless drive can write |
| [packagekit-control](interfaces/packagekit-control-interface) | control the PackageKit service | Super privileged, Packaging | no |
| [password-manager-service](interfaces/password-manager-service-interface) | read, add, change, or remove saved passwords | System, Security | no |
| [pcscd](interfaces/pcscd-interface) | permits communication with PCSD smart card daemon | Security | no |
| [personal-files](interfaces/personal-files-interface) | read or write files in the user's home directory | Super privileged, Personal data, Attributes | no |
| [physical-memory-control](interfaces/physical-memory-control-interface) | read and write memory used by any process | System, Memory, Kernel | no |
| [physical-memory-observe](interfaces/physical-memory-observe-interface) | read memory used by any process | System, Memory, Kernel | no |
| [pipewire](interfaces/pipewire-interface) | access the PipeWire server | Audio, Media, Video | no |
| [pkcs11](interfaces/pkcs11-interface) |  enables the cryptographic token interface standard to be used | Security, Super privileged | no |
| [polkit](interfaces/polkit-interface) | access to the polkit authorisation manager | Security, System, Super privileged | no |
| [polkit-agent](interfaces/polkit-agent-interface) | permits applications to register as _polkit_ agents | Security, System, Super privileged | no |
| [posix-mq](interfaces/posix-mq-interface) | enables inter-process communication (IPC) messages | Super privileged, IPC | no by default, yes with snaps from the same publisher |
| [power-control](interfaces/power-control-interface) | read and write system power settings | System, Power | no |
| [ppp](interfaces/ppp-interface) | access to configure and observe PPP networking | Network | no |
| [process-control](interfaces/process-control-interface) | pause or end any process on the system | System | no |
| [ptp](interfaces/ptp-interface) | access to the Precision Time Protocol subsystem | System, Developer | no |
| [pulseaudio](interfaces/pulseaudio-interface) | play and record sound | Audio, Media | no |
| [pwm](interfaces/pwm-interface) | access specific PWM channels | System, Developer, Hardware, WIP | no |
| [qualcomm-ipc-router](interfaces/qualcomm-ipc-router-interface) | access Qualcomm IPC router sockets | IPC, Kernel, System | no |
| [raw-input](interfaces/raw-input-interface) | access raw input devices directly | System, Developer, Hardware | no |
| [raw-usb](interfaces/raw-usb-interface) | access USB hardware directly | System, Developer, Hardware | no |
| [raw-volume](interfaces/raw-volume-interface) | access specific disk partitions | Storage | no |
| [remoteproc](interfaces/remoteproc-interface) | interact with the kernel's Remote Processor Framework  |Super privileged | no |
| [ros-opt-data](interfaces/ros-opt-data-interface) | read-only access to ROS directories | Storage | no |
| [ros-snapd-support](interfaces/ros-snapd-support-interface) | allows the snaps ros-snapd and ros2-snapd the use of snapd’s apps control API | Super privileged | no |
| [removable-media](interfaces/removable-media-interface) | read/write files on removable storage devices | Storage | no |
| [screencast-legacy](interfaces/screencast-legacy-interface) | allows screen recording and audio recording alongside writing to arbitrary filesystem paths | Legacy | no |
| [screen-inhibit-control](interfaces/screen-inhibit-control-interface) | prevent screen sleep, lock and screensaver | Display | yes |
| [scsi-generic](interfaces/scsi-generic-interface) | read and write access to SCSI Generic driver devices | Storage, Super privileged | no |
| [sd-control](interfaces/sd-control-interface) | control SD cards on specific devices | Super privileged, Storage | no |
| [serial-port](interfaces/serial-port-interface) | access serial port hardware | System, Developer, Hardware | no |
| [shared-memory](interfaces/shared-memory-interface) | enables two snaps to access the same shared memory | Super privileged, IPC | no by default, yes with snaps from the same publisher |
| [shutdown](interfaces/shutdown-interface) | restart or power off the device | Super privileged, System, Power | no |
| [snap_interfaces_requests_control](interfaces/snap_interfaces_requests_control-interface) | enables the prompting API and its access to prompting-related notice types | System | no |
| [snap-refresh-control](interfaces/snap-refresh-control-interface) | permits bespoke snap refresh control | Super privileged, Packaging | no |
| [snap-refresh-observe](interfaces/snap-refresh-observe-interface) | enables the tracking of snap refreshes | Super privileged, Packaging | no |
| [snapd-control](interfaces/snapd-control-interface) | install or remove software | Super privileged, Packaging | no |
| [spi](interfaces/spi-interface) | access specific SPI devices | System, Developer, Hardware | no |
| [ssh-keys](interfaces/ssh-keys-interface) | access SSH private and public keys | Security | no |
| [ssh-public-keys](interfaces/ssh-public-keys-interface) | access SSH public keys | Security | no |
| [steam-support](interfaces/steam-support-interface) | allows the Steam snap to access pressure-vessel containers | Super privileged, Discrete | no |
| [storage-framework-service](interfaces/storage-framework-service-interface) | operate as, or interact with, the Storage Framework | Storage | no |
| [system-backup](interfaces/system-backup-interface) | read-only access to the system for backups | Storage | no |
| [system-files](interfaces/system-files-interface) | read or write files in the system | Super privileged, Storage, Attributes | no |
| [system-observe](interfaces/system-observe-interface) | read process and system information | Monitoring, System | no |
| [system-packages-doc](interfaces/system-packages-doc-interface) | access system documentation in /usr/share/doc | Developer | no |
| [system-source-code](interfaces/system-source-code-interface) | access kernel source and headers in /usr/src | Developer | no |
| [system-trace](interfaces/system-trace-interface) | monitor or control any running program | Monitoring, System | no |
| [tee](interfaces/tee-interface) | permits access to the Trusted Execution Environment | Super privileged, Security, Ubuntu Core | no |
| [thumbnailer-service](interfaces/thumbnailer-service-interface) | create thumbnail images from local media files | Storage, Media | no |
| [time-control](interfaces/time-control-interface) | change the date and time | Time | no |
| [timeserver-control](interfaces/timeserver-control-interface) | change time server settings | Time | no |
| [timezone-control](interfaces/timezone-control-interface) | change the time zone | Time | no |
| [tpm](interfaces/tpm-interface) | allows access to the Trusted Platform Module device | Kernel, Security | no |
| [u2f-devices](interfaces/u2f-devices-interfacet/the-u2f-devices-interface/9722/) | use any U2F devices | Security, Hardware, Developer | no |
| [ubuntu-download-manager](interfaces/ubuntu-download-manager-interface) | use the Ubuntu Download Manager | System, Developer, Manage software | yes |
| [udisks2](interfaces/udisks2-interface) | access the UDisks2 service | Storage | no |
| [uhid](interfaces/uhid-interface) | create kernel UID devices from user-space | Hardware, Kernel, System | no |
| [uinput](interfaces/uinput-interface) | allows write access to /dev/uinput | Super privileged, Hardware | no |
| [uio](interfaces/uio-interface) | access uio devices | Hardware, System | no |
| [unity7](interfaces/unity7-interface) | access legacy desktop resources from Unity7 | Display | yes |
| [unity8](interfaces/unity8-interface) | share data with other Unity 8 apps | Display, Super privileged | yes |
| [unity8-calendar](interfaces/unity8-calendar-interface) | read/change shared calendar events in Ubuntu Unity 8 | Personal data | no |
| [unity8-contacts](interfaces/unity8-contacts-interface) | read/change shared contacts in Ubuntu Unity 8 | Personal data | no |
| [upower-observe](interfaces/upower-observe-interface) | access battery level and power usage | System, Power | yes |
| [userns](interfaces/userns-interface) | permits a snap to create a new namespace | Super privileged | no |
| [vcio](interfaces/vcio-interface) | access a Raspberry Pi's VideoCore multimedia processor | Video, Graphics, Ubuntu Core | no |
| [wayland](interfaces/wayland-interface) | access compositors providing the Wayland protocol | Display | yes |
| [x11](interfaces/x11-interface) | monitor mouse/keyboard input and graphics output of other apps | Display | yes |
| [xilinx_dma](interfaces/xilinx-dma-interface) | allows access to Xilinx DMA IP from a connected PCIe card | Ubuntu Core, Super privileged | no |

