(snap-reference-operations-interfaces-system-interfaces)=
# System interfaces

System [Interfaces](/snap-explanation/interfaces/all-about-interfaces) are interfaces that control privileged access to system resources, such as user account control, inter-process communication, firewall configuration and hardware monitoring. 

See [Supported interfaces](/snap-reference/operations/interfaces/index) for a complete list of interfaces.

## System interfaces

| Interface | Description | Categories | Auto-connect |
|---|----|---|---|
| [account-control](/) | add/remove user accounts or change passwords | System, Account | no |
| [accounts-service](/) | allows communication with the accounts service | System, Account | no |
| [appstream-metadata](/) | allows access to AppStream metadata | System, Developer, Manage software | no |
| [autopilot-introspection](/) | be controlled by Autopilot software | System, Developer | no |
| [bool-file](/) | allows access to specific file with bool semantics | System, Low level, Privileged | no |
| [broadcom-asic-control](/) | control Broadcom network switches | Network, System | no |
| [can-bus](/) | allows access to the CAN bus | System, Developer | no |
| [core-support](/) | deprecated since snap 2.34 | System, Other | no |
| [cpu-control](/) | set certain CPU values | System, Developer | no |
| [daemon-notify](/) | allows sending daemon status changes to service manager | System, Developer | no |
| [dbus](/) | allow snaps to communicate over D-Bus | System, Developer | no |
| [dummy](/) | renamed to empty interface | System, Other | no |
| [empty](/) | allows testing without additional permissions | System, Other | no |
| [fwupd](/) | allows operating as the fwupd service | System, Security, Firmware | no |
| [gconf](/) | access the legacy GConf config system | System, Developer, Settings | no |
| [gsettings](/) | provides access to any GSettings item for current user | System, Developer, Settings | yes |
| [hardware-observe](/) | access hardware information | System, Hardware | no |
| [hardware-random-control](/) | provide entropy to hardware random number generator | System, Hardware | no |
| [hardware-random-observe](/) | use hardware-generated random numbers | System, Hardware | no |
| [hidraw](/) | access hidraw devices | System | no |
| [hugepages-control](/) | control HugePages memory blocks | System, Memory, Kernel | no |
| [i2c](/) | access i²c devices | System, Hardware | no |
| [iio](/) | access IIO devices | System, Hardware | no |
| [intel-mei](/) | access to the Intel MEI management interface | System, Firmware | no |
| [io-ports-control](/) | allows access to all I/O ports | System, | no |
| [ion-memory-control](/) | access Android's ION memory allocator | System  | no |
| [kernel-crypto-api](/) | read and manage kernel supported crypto ciphers | System, Kernel, Security | no |
| [kernel-module-control](/) | insert, remove and query kernel modules | Super privileged, System, Kernel | no |
| [kernel-module-load](/) | load, or deny loading, specific kernel modules | Super privileged, System, Kernel | no |
| [kernel-module-observe](/) | query kernel modules | System, Kernel | no |
| [log-observe](/) | read system logs | System, Developer | no |
| [login-session-control](/) | allows setup of login sessions and grants privileged access to user sessions | System, Security | no |
| [login-session-observe](/) | allows reading login and session information | System, Security | no |
| [nomad-support](/) | enable's HashiCorp's Nomad to access CPU and memory management | System, Containers, Service | no     | 
| [password-manager-service](/) | read, add, change, or remove saved passwords | System, Security | no |
| [physical-memory-control](/) | read and write memory used by any process | System, Memory, Kernel | no |
| [physical-memory-observe](/) | read memory used by any process | System, Memory, Kernel | no |
| [polkit](/) | access to the polkit authorisation manager | System, Security | no |
| [polkit-agent](/) | permits applications to register as _polkit_ agents | System, Security | no |
| [power-control](/) | read and write system power settings | System, Power | no |
| [process-control](/) | pause or end any process on the system | System | no |
| [ptp](/) | access to the Precision Time Protocol subsystem | System, Developer | no |
| [pwm](/) | access specific PWM channels | System, Developer, Hardware, WIP | no |
| [qualcomm-ipc-router](/) | access Qualcomm IPC router sockets | IPC, Kernel, System | no |
| [raw-input](/) | access raw input devices directly | System, Developer, Hardware | no |
| [raw-usb](/) | access USB hardware directly | System, Developer, Hardware | no |
| [serial-port](/) | access serial port hardware | System, Developer, Hardware | no by default, yes with snaps from the same publisher |
| [shutdown](/) | restart or power off the device | System, Power | no |
| [snap_interfaces_requests_control](/) | enables the prompting API and its access to prompting-related notice types | [System](/snap-reference/operations/interfaces/system-interfaces) | no | 
| [spi](/) | access specific SPI devices | System, Developer, Hardware | no |
| [system-observe](/) | read process and system information | Monitoring, System | no |
| [system-trace](/) | monitor or control any running program | Monitoring, System | no |
| [ubuntu-download-manager](/) | use the Ubuntu Download Manager | System, Developer, Manage software | yes |
| [uhid](/) | create kernel UID devices from user-space | Hardware, Kernel, System | no |
| [uio](/) | access uio devices | Hardware, System | no |
| [upower-observe](/) | access battery level and power usage | System, Power | yes |

