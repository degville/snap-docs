(snap-reference-release-notes)=
# Release notes

This page outlines the release notes of all recent versions of Snapd, summarising new features, bug fixes and changes in each version.

## Recent releases

<!--
## Latest beta release
-->

## Latest stable release

* **[Snapd 2.67](#p-147645-snapd-267-release-notes)** (13th January 2025)

### Older releases

* [Snapd 2.66](#p-147645-snapd-266-release-notes) (26th November 2024)
* [Snapd 2.65](#p-147645-snapd-266-release-notes)  (8th October 2024)
* [Snapd 2.64](#p-147645-snapd-264-release-notes) (25th July 2024)
* [Snapd 2.63](#p-147645-snapd-263-release-notes)  (6th June 2024)
* [Snapd 2.62](#p-147645-snapd-262-release-notes) (15th April 2024)
* [Snapd 2.61](#p-147645-snapd-261-release-notes) (3rd January 2024)

## Release policy and schedule

The snapd package updates automatically, and by default, checks for updates 4 times a day. To manually update or modify this process, see [Managing updates](/snap-how-to-guides/work-with-snaps/manage-updates).

[Channels](/snap-explanation/how-snaps-work/channels-and-tracks) are used to distinguish between stable releases, which are always available from the stable channel, and beta and testing releases, which can be installed from the candidate, beta and edge channels.

To install snapd from the beta channel, for example, use the following command:

```bash
sudo snap refresh snapd --beta
```

To ensure you receive latest security updates and bug fixes, ensure you upgrade to a new release of Snapd shortly after it is released.

For the release plan and complete list of changes, please refer to the [snapd roadmap](/). Feel free to provide your test feedback on the [forum](https://forum.snapcraft.io/c/snapd/5), or directly in [Launchpad](https://bugs.launchpad.net/snapd/+filebug).

We greatly appreciate your contributions and support!

---

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

