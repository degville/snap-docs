(snap-reference-operations-interfaces-network-interfaces)=
# Network interfaces

Network [Interfaces](/snap-explanation/interfaces/all-about-interfaces) are interfaces that control one or more network access elements. These include local device access, networking hardware, and network settings, configuration and visibility.

See [Supported interfaces](/snap-reference/operations/interfaces/index) for a complete list of interfaces.

| Interface | Description | Categories | Auto-connect |
|---|----|---|---|
| [avahi-control](/) | advertise services over the local network | [Network](/snap-reference/operations/interfaces/network-interfaces), Local network, Nearby devices | no |
| [avahi-observe](/) | detect services and devices over the local network | [Network](/snap-reference/operations/interfaces/network-interfaces), Local network, Nearby devices | no |
| [bluetooth-control](/) | access Bluetooth hardware directly | [Network](/snap-reference/operations/interfaces/network-interfaces), Bluetooth, Nearby devices | no |
| [bluez](/) | use Bluetooth devices | [Network](/snap-reference/operations/interfaces/network-interfaces), Bluetooth, Nearby devices | no |
| [broadcom-asic-control](/) | control Broadcom network switches | [Network](/snap-reference/operations/interfaces/network-interfaces), [System](/snap-reference/operations/interfaces/system-interfaces) | no |
| [browser-support](/) | use functions essential for Web browsers | Browser, [Network](/snap-reference/operations/interfaces/network-interfaces) | no when allow-sandbox: true, yes otherwise |
| [cifs-mount](/) | allows the mounting and unmounting of CIFS filesystems | [Network](/snap-reference/operations/interfaces/network-interfaces),Storage | no |
| [firewall-control](/) | configure a network firewall | [Network](/snap-reference/operations/interfaces/network-interfaces) | no |
| [hostname-control](/) | allows configuring the system hostname | [Network](/snap-reference/operations/interfaces/network-interfaces) | no |
| [microovn](/) | used only by the MicroOVN snap for socket access | [Network](/snap-reference/operations/interfaces/network-interfaces) | no |
| [modem-manager](/) | use and configure modems | [Network](/snap-reference/operations/interfaces/network-interfaces) | no |
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
| [ofono](/) | allows operating as the oFono service | [Network](/snap-reference/operations/interfaces/network-interfaces), Discrete, Developer | no |
| [openvswitch](/) | control Open vSwitch hardware | [Network](/snap-reference/operations/interfaces/network-interfaces), Service, Developer | no |
| [openvswitch-support](/) | enables kernel support for Open vSwitch | [Network](/snap-reference/operations/interfaces/network-interfaces), Service, Developer | no |
| [ppp](/) | access to configure and observe PPP networking | [Network](/snap-reference/operations/interfaces/network-interfaces) | no |

