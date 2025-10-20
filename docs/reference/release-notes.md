(reference-release-notes)=
# Release notes

This page outlines the release notes of all recent versions of Snapd, summarising new features, bug fixes and changes in each version.

## Recent releases

### Latest stable release

* **[Snapd 2.71](snapd-2-71-release-notes)** (14th August 2025)

### Latest beta release

* [Snapd 2.72](snapd-2-72-release-notes) (30th September 2025)

### Older releases

* [Snapd 2.71](#snapd-2-71-release-notes) (14th August 2025)
* [Snapd 2.70](#snapd-2-70-release-notes) (31th June 2025)
* [Snapd 2.68](#snapd-2-68-release-notes) (31st March 2025)
* [Snapd 2.67](#snapd-2-67-release-notes) (13th January 2025)
* [Snapd 2.66](#snapd-2-66-release-notes) (26th November 2024)
* [Snapd 2.65](#snapd-2-65-release-notes) (8th October 2024)
* [Snapd 2.64](#snapd-2-64-release-notes) (25th July 2024)
* [Snapd 2.63](#snapd-2-63-release-notes) (6th June 2024)
* [Snapd 2.62](#snapd-2-62-release-notes) (15th April 2024)
* [Snapd 2.61](#snapd-2-61-release-notes) (3rd January 2024)

## Release policy and schedule

The snapd package updates automatically, and by default, checks for updates 4 times a day. To manually update or modify this process, see [Managing updates](/how-to-guides/work-with-snaps/manage-updates).

[Channels](/explanation/how-snaps-work/channels-and-tracks) are used to distinguish between stable releases, which are always available from the stable channel, and beta and testing releases, which can be installed from the candidate, beta and edge channels.

To install snapd from the beta channel, for example, use the following command:

```bash
sudo snap refresh snapd --beta
```

To ensure you receive latest security updates and bug fixes, ensure you upgrade to a new release of Snapd shortly after it is released.

For the release plan and complete list of changes, please refer to the [snapd roadmap](/). Feel free to provide your test feedback on the [forum](https://forum.snapcraft.io/c/snapd/5), or directly in [Launchpad](https://bugs.launchpad.net/snapd/+filebug).

We greatly appreciate your contributions and support!

---

## Snapd 2.72 release notes

We’re pleased to share that Snapd 2.72 snap is available for testing in the beta channel.

### **Highlights**

* Enable the gpio-chardev interface now with the more robust gpio-aggregator configfs kernel interface ([LP: #1916244](https://bugs.launchpad.net/snapd/+bug/1916244))
* FDE enhancements and additions: add generic reseal function and correct sealing with kernel command line defaults, support replacing TPM protected keys at runtime, secboot preinstall check fix actions and using OPTEE (Ubunbu Core & arm) for protecting keys, as an alternative to existing fde-setup hooks.

### **Notable updates**

* snap-confine: fix non-suid limitation by switching to root:root to operate v1 freezer
* Fix preseeding failure due to scan-disk issue on RPi
* Snap installation: skip snap icon download when running in a cloud or using a proxy store ([LP: #2122054](https://bugs.launchpad.net/snapd/+bug/2122054))
* snap-confine: fix error message with /root/snap not accessible ([LP: #2117558](https://bugs.launchpad.net/snapd/+bug/2117558))
* Interfaces: do not expose Kerberos tickets for classic snaps ([LP: #2121238](https://bugs.launchpad.net/snapd/+bug/2121238))
* Cleanly support socket activation for classic snap ([LP: #2117121](https://bugs.launchpad.net/snapd/+bug/2117121))
* Improve progress reporting for snap install/refresh ([LP: #2112626](https://bugs.launchpad.net/snapd/+bug/2112626))
* Extend output to indicate when snap data snapshot was created during remove ([LP: #2114704](https://bugs.launchpad.net/snapd/+bug/2114704))

For the release plan and complete list of changes, please refer to the [full release notes](https://forum.snapcraft.io/t/the-snapd-roadmap/1973).

### **More about GPIO Chardev**

This release supports the kernel GPIO character device API with specific GPIO lines mediation through the new gpio-chardev interface which offers more fine-grained control over the gpio-control interface that allowed unrestricted access to all GPIO chips when needed.

For historical context: traditionally Snapd supported mediation of the sysfs interface for GPIO access. This sysfs kernel interface is considered legacy by upstream kernel developers (and will be removed from UC26+ kernels) and it has been replaced by a new character device API, commonly referred to as gpiod.

The new kernel GPIO APIs are typically consumed through the libgpiod library (C or various bindings) or a set of command line utilities provided by said library.

For more information on how to use the new interface (and migration from the older gpio interface), please check the official documentation for the gpio-chardev interface:[ https://forum.snapcraft.io/t/the-gpio-chardev-interface/46411](https://forum.snapcraft.io/t/the-gpio-chardev-interface/46411).

### **More about our FDE journey**

***The previous release***, 2.71, concluded the Snapd contribution to TPM FDE for the 25.10 [install image](https://cdimage.ubuntu.com/daily-live/current/questing-desktop-amd64.iso).

Progression through the 25.10 cycle up to 2.71:
* 2.68.* - introduced a new key format, added support for passphrases during installation, and included various fixes.
* 2:70 - set roles in TPM keys and fixed resealing with the v1 hook key format.
* 2.71 - added recovery key auto-repair, delivered many additional APIs needed to support installation and use of TPM-backed FDE on hybrid Ubuntu 25.10, and included further fixes.

As part of this work, secboot has been improved to more extensively check whether the platform can support secure boot, which is used by one of the new Snapd APIs introduced in 2.71 and used by the installer to determine TPM FDE availability during hybrid Ubuntu installation.

***This release***, along with releases 2.73 and 2.74 planned for next cycle, will extend and refine the TPM FDE hybrid Ubuntu installation and overall user experience for the Ubuntu 26.04 LTS release.

A lot of care goes into continually ensuring compatibility with Ubuntu Core, previous versions of Snapd and targeted hardware. Each release must pass extensive testing, including test suites for certified hardware. In addition to our own rigorous testing, we strongly advise all users to also thoroughly test all their hardware variations and inform us of potential issues or concerns as soon as possible.

For a broader overview on TPM backed FDE for hybrid Ubuntu 25.10, see: [TPM/FDE progress for Ubuntu 25.10](https://discourse.ubuntu.com/t/tpm-fde-progress-for-ubuntu-25-10/65146)

### **Test Feedback**

Feel free to provide your test feedback here or directly in [Launchpad](https://bugs.launchpad.net/snapd/+filebug). To help fast track investigations please provide (1) details about the system, (2) Snapd version(s) and (3) steps to reproduce the issue.

## Snapd 2.71 release notes

## **Highlights**

* Support for TPM backed Full Disk Encryption on Ubuntu 25.10

## **Notable updates**
* Fix offline remodel case where we switched to a channel without an actual refresh
* Reject system key mismatch advice when not yet seeded ([LP: #2114923](https://bugs.launchpad.net/ubuntu-desktop-provision/+bug/2114923))
* Make removal of last active revision of a snap equal to snap remove ([LP: #2112551](https://bugs.launchpad.net/bugs/2112551))
* Allow non-gpt in fallback mode to support RPi ([LP: #2114779](https://bugs.launchpad.net/ubuntu/+source/linux-raspi/+bug/2114779))
* Fix \`snap debug connectivity\` check for RISC-V ([LP: #2112544](https://bugs.launchpad.net/ubuntu/+source/snapd/+bug/2112544))
* Exclude snap/snapd/preseeding when generating preseed tarball ([LP: #2112332](https://bugs.launchpad.net/snapd/+bug/2112332))
* Fix snap command progress reporting ([LP: #1952500](https://bugs.launchpad.net/bugs/1952500))
* Interfaces: kerberos-tickets | add new interface ([LP: #1849346](https://bugs.launchpad.net/ubuntu/+source/chromium-browser/+bug/1849346))
* Interfaces: log-observe | add capability dac_read_search ([LP: #2098780](https://bugs.launchpad.net/bugs/2098780))
* Interfaces: block-devices | opt-in access to individual partitions ([LP: #2033883](https://bugs.launchpad.net/snapd/+bug/2033883))

## **More about TPM backed FDE on Ubuntu Core and Ubuntu 25.10**

To support hybrid Ubuntu 25.10+ systems, we’ve introduced a new key format. On Ubuntu Core this change is transparent to users, but it enables us to transition from file-based key storage to storing keys in the LUKS2 header (with header redundancy) on core26.

On previous versions of Ubuntu Core, once a reboot required a recovery key, the device would continue prompting for that key on every subsequent boot. This could be particularly problematic for unattended or remote devices. This behavior was improved so that after a firmware update, entering the recovery key triggers an automatic repair and restores normal unattended boot operation without further prompts.

The [fwupd](https://snapcraft.io/fwupd) tool is available both as a deb and as a snap providing a unified way to install and manage system firmware updates. Support has been added for updating the UEFI DBX (UEFI Secure Boot forbidden signatures database) without requiring a recovery key on reboot. This ensures that both hybrid Ubuntu 25.10+ and Ubuntu Core devices with Full Disk Encryption seamlessly apply DBX updates.

For an overview on TPM backed FDE for hybrid Ubuntu 25.10, see: [TPM/FDE progress for Ubuntu 25.10](https://discourse.ubuntu.com/t/tpm-fde-progress-for-ubuntu-25-10/65146)

## Snapd 2.70 release notes

### Highlights

* `snap-confine` no longer requires to be `setuid` root, now uses file capabilities and executes in the security context of the user who invokes it.
* snapd.apparmor is now enabled on Fedora, so that a Fedora container running on an apparmor-capable kernel works correctly.

### Notable updates

* Reset SHELL to /bin/bash in non-classic snaps ([LP: #2107443](https://bugs.launchpad.net/snapd/+bug/2107443))
* Only cancel notices requests on stop/shutdown ([LP: #2104066](https://bugs.launchpad.net/snapstore-server/+bug/2104066))
* Fix GLX on nvidia when xorg is confined by AppArmor ([LP: #2088456](https://bugs.launchpad.net/canonical-kernel-snaps/+bug/2102456))
* Fix snap-bootstrap busy loop ([LP: #2106121](https://bugs.launchpad.net/snapd/+bug/2106121))
* Update secboot and modify snap-bootstrap to remove usage of go templates to reduce size by 4MB ([LP: #2102456](https://bugs.launchpad.net/canonical-kernel-snaps/+bug/2102456))

### More about no-setuid snap confine

In an effort to increase the security and have better control over the execution of privileged binaries, the snap application bootstrapping helper, snap-confine, no longer requires to be setuid root. Instead it relies on file capabilities and executes in the security context of the user who invoked it. The required capabilities are effectively a subset of all the capabilities which were previously obtained immediately when executing the privileged binary. The effective capabilities are dynamically switched at runtime, such that the helper executes with the least set of effective privileges at any given time.

For the release plan and complete list of changes, please refer to the [full release notes](https://forum.snapcraft.io/t/the-snapd-roadmap/1973). Please note that 2.70 includes all the changes in the superseded 2.69 and 2.69.1 releases.

## Snapd 2.68 release notes

The official release for this version was Snapd 2.68.4.

### Highlights

* [FDE](https://ubuntu.com/core/docs/full-disk-encryption): Add support for a new and more extensible key format and passphrases for encrypted partitions can now be specified during installation
* [Components](https://snapcraft.io/docs/components): Support online/offline [remodeling](https://ubuntu.com/core/docs/remodelling) and the creation of new recovery systems for models that contain components, on Ubuntu Core as well as Hybrid systems. Components are useful for distributing optional resources for a snap, such as debug symbols alongside snap binaries, and kernel modules alongside a kernel snap.
* [Kernel Components](https://canonical-snapcraft.readthedocs-hosted.com/en/stable/reference/components.html): Make kernel components and modules available in early boot
* Interfaces: Added [auditd-support interface](https://snapcraft.io/docs/auditd-support-interface) that allows a snap to ship auditd as part of a snap and `checkbox-support` interface that allows unrestricted access to devices when testing with checkbox

### Notable updates
* Fix issue preventing hybrid systems from being seeded on first boot
* Modify AppArmor template to allow using setpriv to run ([LP: #20729871](https://bugs.launchpad.net/snapd/+bug/2072987))
* Disable udev backend when inside a container ([LP: #1712808](https://bugs.launchpad.net/snapd/+bug/1712808)
* Remove auto-import udev rules not required by deb package to avoid unwanted syslog errors ([LP: #1966203](https://bugs.launchpad.net/snapd/+bug/1966203))
* Fix progress reporting when stdout is on a tty, but stdin is not ([LP: #1886414](https://bugs.launchpad.net/ubuntu/+source/chromium-browser/+bug/1886414))

### Experimental Features
* Removed stale `robust-mount-namespace-updates` experimental flag
* Removed rejected `snapd-snap` experimental feature and its feature flag

### Impact on Ubuntu Core using Full Disk Encryption

If you are planning to test or use this snapd release and you are using full disk encryption (with both hooks and TPM), some updates to your kernel snap are needed:
* If you maintain your own kernel snap, you will need to include the new snap-bootstrap.
* If you are using a kernel snap maintained by Canonical, all our kernel snaps will be updated to the new version of snap-bootstrap in due course.

Until all kernel snaps are updated, snapd from latest/edge cannot be used for installation or remodeling if you are using FDE. If you have not updated the kernel snap, do not report bugs you encountered when:
* Remodeling with a snapd from latest/edge, then doing factory reset.
* Installing fresh images with snapd from latest/edge

## Snapd 2.67 release notes

*Released 13th January 2025*

### Highlights:

* **Registry views**
   
   This feature has evolved beyond cross-snap configuration, now enabling custodian snaps to validate changes and store registry data outside of snapd.

* **Components**

  Standard components are now broadly usable, after the addition of the `snap components` command, support for joint install of snaps and components from local files, and tab completion.

   Building on standard components, kernel components have been enhanced with support for the `snapctl model` command for kernel snaps as well as other improvements to enable kernel drivers for proprietary hardware on Ubuntu Core.

### Notable bug fixes:

* AppArmor Prompting: Fixed an issue with overlapping rules ([bug report](https://github.com/canonical/desktop-security-center/issues/74))
* Resolved a deadlock edge case related to app awareness during refresh operations ([LP2084730](https://bugs.launchpad.net/snapd/+bug/2084730))
* Addressed issues with reloading service activation units to prevent systemd errors ([LP2083961](https://bugs.launchpad.net/snapd/+bug/2083961))
* Fixed the generation of AppArmor profiles with incorrect revisions during concurrent refreshes of snaps using the content interface
* Fix AppArmor permissions to allow snaps access to kernel modules and firmware on UC24, which also fixes the kernel-modules-control interface on UC24
* Fix ‘snap run’ getent based user lookup in case of bad PATH (LP2090938 2)
* Fix snapd using the incorrect AppArmor version during undo of an refresh
* Extended hardware-observe interface to allow support riscv_hwprobe syscall and mount-observe interface to allow listmount and statmount syscalls


For the release plan and the complete list of changes, please refer to the [Snapd roadmap](/).

## Snapd 2.66 release notes

*Released 26th November 2024*

This release added the ability for Snapcraft 8.x to build snapd using with core22 base, and support for building a snapd variant that's [FIPS](https://en.wikipedia.org/wiki/FIPS_140-3) compliant. 

Other highlights include:

*  **AppArmor prompting**

   In collaboration with the security and desktop teams at Canonical, this release of snapd includes the functionality required for snaps to request interface access from the user. 

   For more information on this feature, including design details and how it can be tested in Ubuntu 24.10, see [Introducing Permissions Prompting](https://discourse.ubuntu.com/t/ubuntu-desktop-s-24-10-dev-cycle-part-5-introducing-permissions-prompting/47963).

* **Experimental confdb support**

   This release includes many updates to support _confdb_, formerly known as Registry, which will significantly improve how we handle configuration data and share that data between snaps and devices.

## Snapd 2.64 release notes

*Released 26th November 2024*

For the 2.64 release, we updated the build process to use Ubuntu 22.04 instead of Ubuntu 16.04. This change only affected the snapd.snap, and had impact on builds for Debian, Fedora, Arch, openSUSE, or any other classic package

Users should see no changes or compatibility issues, and if you are a snapd developer, this change makes building snapd easier. The latest Snapcraft releases can now be used to build a local version of the snapd package. In the long term, this will also improve our iteration speed as we’ll require fewer snapd builds, providing developers with faster feedback on their changes.

As part of this release cycle, our `ubuntu-image` and validation-sets documentation also improved.

## Snapd 2.63 release notes

*Released 6th June 2024*

Snap-based [Ubuntu Core](https://ubuntu.com/core) devices will benefit from many of our the features for this release, including support for [Offline remodelling](https://ubuntu.com/core/docs/uc20/remodelling#heading--offline), the use of [Validation sets](https://snapcraft.io/docs/validation-sets) in the [model assertion](https://ubuntu.com/core/docs/reference/assertions/model) and setting a custom port for SSH. 

There’s also a new `snap sign` [`--chain`](https://ubuntu.com/core/docs/system-user#heading--generating-auto) argument in this release, that can be used to aggregate all the assertions required to create a new system user.

## Snapd 2.62 release notes

*Released 15th April 2024*

The functionality to add custom device interfaces to an app is now complete, as is our create and removal functionality for Ubuntu Core recovery systems. We’ve also finally made a commitment on what minimum [system requirements](https://ubuntu.com/core/docs/system-requirements) might actually be for Ubuntu Core, even if you can’t actually buy a device with less than several gigabytes of on-board RAM.

This release also included two significant additions to our documentation. Firstly, the Docker interface now includes a fully realised example implementation, and secondly, we’ve completed a new page on recovery system via the REST API, thanks to Andrew.

Finally, this release included new packages for Arch Linux, Amazon Linux, Debian, Fedora, openSUSE and Solus.

## Snapd 2.61 release notes

*Released 3rd January 2024*

This release included a lot of background work that will later be used by `confdb` (see Snapd 2.66), to help with  cross-snap configuration. This includes new rules for parsing assertions and a per-aspect field, plus a vital new ability to unset values from the command line.

We also got closer to finishing our opt-in AppArmor prompting support , with some important background improvements, and created a specification for the desktop user-experience flow. Our cross-distribution support also improved with this release, with a new repository and packages for Amazon Linux , and snapd 2.61.1 releases for Debian Sid and Fedora 38, 39, Rawhide and EPEL 7, 8 and 9.

