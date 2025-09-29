(snap-tutorials-install-the-daemon-index)=
# Install the daemon

Snaps are app packages for desktop, cloud and IoT that are easy to install, secure, cross-platform and dependency-free. 

The snap daemon, known as *snapd*, is the background service that manages and maintains your snaps. It needs to be  running before a snap can be installed.

Fortunately, the snap daemon is pre-installed and running on many distributions by default, and it's easy to install on most other distributions.

## Snap pre-installed

The snap daemon (snapd) is pre-installed and ready to go on the following:

| | |
|--|--|
| [KDE Neon](https://neon.kde.org/) | [Manjaro](https://manjaro.org/) |
[Solus](https://getsol.us/) | [Ubuntu](https://ubuntu.com/) 18.04 and above |
 | Most [Ubuntu flavours](https://wiki.ubuntu.com/DerivativeTeam/Derivatives#Official_Ubuntu_Flavors) | [Zorin OS](https://zorinos.com/) |

## Without snap

For distributions without the snap daemon pre-installed, use the links below for specific installation instructions:

| | |
|--|--|
| [AlmaLinux OS](/snap-tutorials/install-the-daemon/almalinux-os) | [Arch Linux](/snap-tutorials/install-the-daemon/arch-linux)|
| [CentOS](/) | [Debian](/snap-tutorials/install-the-daemon/debian)|
| [elementary OS](/snap-tutorials/install-the-daemon/elementary-os) | [Fedora](/snap-tutorials/install-the-daemon/fedora) |
| [GalliumOS](/) | [Kali Linux](/) |
| [KDE Neon*](/) | [Kubuntu](/) |
| [Linux Mint](/snap-tutorials/install-the-daemon/linux-mint) | [Lubuntu](/) | 
|[Manjaro*](/snap-tutorials/install-the-daemon/manjaro-linux) | [openSUSE](/snap-tutorials/install-the-daemon/opensuse) |
| [Parrot Security OS](/) | [Pop!_OS](/snap-tutorials/install-the-daemon/pop-os) |
| [Raspberry Pi OS](/snap-tutorials/install-the-daemon/raspberry-pi-os) | [Red Hat Enterprise Linux (RHEL)](/) |
| [Rocky Linux](/snap-tutorials/install-the-daemon/rocky-linux) | [Solus](/) |
| [Ubuntu*](/snap-tutorials/install-the-daemon/ubuntu) | [Xubuntu](/) |
| [Zorin OS*](/) | |

**\*** While snapd is pre-installed on these systems, installation instructions can help if you're using older versions, or want to re-install snap after removing it.

See [Troubleshooting](/snap-how-to-guides/fix-common-issues/index) for help resolving installation issues.


```{toctree}
:hidden:
:titlesonly:
:maxdepth: 2
:glob:

*
*/index
